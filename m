From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 12 May 2016 15:01:50 +0800
Subject: [Buildroot] [PATCH 1/1] package/quagga: Fix directories and
 permissions
In-Reply-To: <20160512085809.5615a161@free-electrons.com>
References: <1462953673-1190-1-git-send-email-nroach44@gmail.com>
 <20160511233309.1ea81a24@free-electrons.com> <5733E878.4090700@gmail.com>
 <20160512085809.5615a161@free-electrons.com>
Message-ID: <57342A5E.5070301@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/05/16 14:58, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 12 May 2016 10:20:40 +0800, Nathaniel Roach wrote:
>
>> If you're using vtysh to configure Quagga, yes, it absolutely needs
>> write permissions to the config folder, as it's more than likely you'd
>> want to save your config. (Running commands in vtysh is very similar to
>> Cisco routers, there's a "running-config" and a "startup-config" -
>> commands are saved into running, but are not copied into startup by default)
>>
>> The daemons themselves don't write to /etc unless you tell it to:
>>
>> $sudo vtysh
>> ...
>> charon# copy run start
>> Building Configuration...
>> Configuration saved to /etc/quagga/zebra.conf
>> Configuration saved to /etc/quagga/ospfd.conf
>> [OK]
>>
>> It needs write permissions to the folder as it moves the old config and
>> writes a new one, rather than just overwriting.
>>
>> In the instance that /etc/ is RO, the user simply won't be able to save
>> an updated configuration.
> Right, makes sense. Then, perhaps you want to add a comment on top of
> QUAGGA_CONF_OPTS to indicate why we override localstatedir and
> sysconfdir. Just something like:
>
> # Override localstatedir and sysconfdir so that quagga has its own
> # directories, which is will access with its own user.
>
> or something along those lines (I'm sure a better wording is possible).
>
>>>> +define QUAGGA_PERMISSIONS
>>>> +	/etc/quagga r 600 quagga quagga - - - - -
>>>> +	/etc/quagga d 755 quagga quagga - - - - -
>>> Hum, does this actually work?
>> Yup, unfortunately wildcards don't, and I didn't feel that adding a line
>> for each daemon was appropriate. (There's one for each daemon, and it's
>> only installed if that daemon is selected, hence why I need to
>> effectively do a wildcard chmod here)
> So you need the first line to make every file in /etc/quagga owned by
> quagga, 600, and then the second line to make the /etc/quagga directory
> owned by the quagga user and 755, so that quagga can create more files
> in this directory, right?
That's precisely it. I'll comment this too so it's clearer.
>
>>>> +define QUAGGA_INSTALL_INIT_SYSTEMD
>>>> +	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
>>> This mkdir -p is useless, as $(INSTALL) -D creates all sub-directories
>>> needed to be able to copy to the destination path.
>> Huh, thanks! I believe I copied this from somewhere else, but I'll take
>> it out in the next revision.
> If you've seen it somewhere, try to remember where so that we can fix
> this place as well :-)
Found it: package/audit/audit.mk:49 I'll send that through in another patch.
>
> So overall, looks good. Just fix the very minor nits that I mentioned,
> and it's good to go.
>
> Thanks!
>
> Thomas
Cheers!
