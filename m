From: Christopher McCrory <chrismcc@gmail.com>
Date: Thu, 8 Mar 2018 16:34:39 -0800
Subject: [Buildroot] [PATCH] package: dropbear: make PATH configurable
In-Reply-To: <CAGt4E5s10L9SxMzSR8-CSu1Q23woZGKHuyHgJM4EENWKR7TTqQ@mail.gmail.com>
References: <20180308214403.94906-1-mmayer@broadcom.com>
 <20180308214801.GA8180@scaer>
 <CAGt4E5s10L9SxMzSR8-CSu1Q23woZGKHuyHgJM4EENWKR7TTqQ@mail.gmail.com>
Message-ID: <CALURroToOdxgb1bpT3d50j4POkmh+BkLGOWHQF_fqh0gCuzo-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mar 8, 2018 2:29 PM, "Markus Mayer" <mmayer@broadcom.com> wrote:

On 8 March 2018 at 13:48, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Markus, All,
>
> On 2018-03-08 13:44 -0800, Markus Mayer spake thusly:
>> Make the default PATH dropbear is using configurable.
>>
>> If not specified, it will continue to default to dropbear's
>> DEFAULT_PATH.
>
> Isn't it better to jut let the user provide a ~/.profile file which
> actually sets the PATH?

That's certainly one way to do it and one can still choose to do that
for when it works.

Where we have found it helpful to change the default is for
non-interactive shells, i.e. running a command via ssh without logging
in first. If you try to do "ssh eval-board ifconfig" it'll fail,
because /sbin isn't in the path. And .profile doesn't help you.

There's an example:

$ ssh brcmstb ifconfig
sh: ifconfig: command not found

No surprise, because /sbin isn't in the PATH.

$ ssh brcmstb 'echo $PATH'
/usr/bin:/bin

But hold on. ".profile" does exist and it does add /sbin to the PATH.
Still no luck, though.

$ ssh brcmstb 'cat .profile'
PATH=/bin:/usr/bin:/sbin:/usr/sbin

Of course it works if you specify the full path.

$ ssh brcmstb /sbin/ifconfig
eth0      Link encap:Ethernet  HWaddr 00:10:18:DD:33:10
          inet addr:192.168.15.8  Bcast:192.168.15.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:364 errors:0 dropped:0 overruns:0 frame:0
          TX packets:274 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:65845 (64.3 KiB)  TX bytes:45749 (44.6 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

And when you log in, ".profile" does what you expect it to do. So,
".profile" works for interactive shells, but not for non-interactive
ones.

$ ssh brcmstb
# echo $PATH
/bin:/usr/bin:/sbin:/usr/sbin




ssh -t $host echo $PATH






Hence the idea of allowing a user to modify the DEFAULT_PATH in dropbear
itself.

Regards,
-Markus

> Regards,
> Yann E. MORIN.
>
>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>> ---
>>
>> Please let me know what you think. Thanks.
>>
>>  package/dropbear/Config.in   | 6 ++++++
>>  package/dropbear/dropbear.mk | 8 ++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
>> index 6700778161ba..d38ecf50834a 100644
>> --- a/package/dropbear/Config.in
>> +++ b/package/dropbear/Config.in
>> @@ -55,4 +55,10 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
>>         Enable logging of dropbear access to lastlog. Notice that
>>         Buildroot does not generate lastlog by default.
>>
>> +config BR2_PACKAGE_DROPBEAR_PATH
>> +     string "dropbear default path"
>> +     help
>> +       Use the path specified here as dropbear's default path.
>> +       If not specified, dropbear will use "/usr/bin:/bin".
>> +
>>  endif
>> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
>> index 01a1a07b7696..ddbedf3bce93 100644
>> --- a/package/dropbear/dropbear.mk
>> +++ b/package/dropbear/dropbear.mk
>> @@ -51,6 +51,14 @@ define DROPBEAR_DISABLE_STANDALONE
>>       $(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
>>  endef
>>
>> +ifneq ($(BR2_PACKAGE_DROPBEAR_PATH),"")
>> +define DROPBEAR_CUSTOM_PATH
>> +     $(SED) 's|^\(#define DEFAULT_PATH\).*|\1
$(BR2_PACKAGE_DROPBEAR_PATH)|' $(@D)/options.h
>> +endef
>> +
>> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
>> +endif
>> +
>>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>>       $(INSTALL) -D -m 644 package/dropbear/dropbear.service \
>>               $(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
>> --
>> 2.7.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.-
-------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
     |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
 conspiracy.  |
> '------------------------------^-------^------------------^-
-------------------'
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180308/e5021b41/attachment.html>
