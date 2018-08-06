From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 06 Aug 2018 00:12:20 -0300
Subject: [Buildroot] Handling leading tabs in makedevs [was: [Bug 11191]
 xattr and check-package issue]
References: <2e8f28d9-e074-776e-5bdb-c8713e7ec497@mind.be>
Message-ID: <5b67bc945f9c3_78eb3f98000884789463@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Jul 26, 2018 at 05:17 AM, Arnout Vandecappelle wrote:

[snip]
>> --- Comment #1 from Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> ---
[snip]
>> We could fix this inconsistency by a number of ways:
>> 1) change check-package;
>> 2) try to come up with a solution in package/pkg-generic.mk to remove leading
>> tabs from _PERMISSION. It cannot be a simple $$(strip) because it would remove
>> the newlines;
>> 3) change makedevs to ignore leading tabs/spaces for xattr (as it already does
>> for non-xattr lines). Hackish version to replace the code mentioned above:
>>> if (2 == sscanf(line, "%4095s %254s", name, xattr) && !strcmp(name, "|xattr")) {
> 
>  1 == sscanf(line, " |xattr %254s", xattr)) should be sufficient - " " matches
> any amount of whitespace.

You are right. I will do this.

> 
>  Note that since the xattr handling is something we added ourselves to busybox
> makedevs, we can easily do this.
> 
>> 4) change fs/common.mk to remove the leading tabs/spaces. Something like this:
>>> +++ b/fs/common.mk
>>> @@@ -89,2 -89,2 +89,3 @@@ endi
>>>        $(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
>>> ++      $(SED) "s/^[ \t]*//g" $(FULL_DEVICE_TABLE)
>>>        echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
>> 
>> I think option 4 makes sense because we also will end up with a better
>> formatted device_table.txt.
> 
>  I prefer option 3 or 4 as well. However, I don't agree that it's better
> formatted without the tabs - with the tab in front, it's clearer that the xattr
> belongs to the line above. So I'm more inclined to option 3.

But the tabs are also added in front of files when added by _PERMISSIONS, so you
won't get the visual effect you want.

When someone uses the default device_table.txt this is what we get when
_PERMISSIONS are added for /bin/test:
/dev
/tmp
...
<tab>/bin/test
<tab>|xattr

But that is a file generated and used during the build. We don't care too much
if it is not well aligned.

And option 3 also avoids problems if someone is generating a custom
device_table.txt and intentionally or by mistake adds leading tabs to xattr.

Regards,
Ricardo
