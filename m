From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 10:17:48 +0200
Subject: [Buildroot] Handling leading tabs in makedevs [was: [Bug 11191]
 xattr and check-package issue]
In-Reply-To: <bug-11191-163-nqppynrRK4@https.bugs.busybox.net/>
References: <bug-11191-163@https.bugs.busybox.net/>
 <bug-11191-163-nqppynrRK4@https.bugs.busybox.net/>
Message-ID: <2e8f28d9-e074-776e-5bdb-c8713e7ec497@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Taking this to the mailing list, more appropriate for this discussion IMO.]


> --- Comment #1 from Ricardo Martincoski <ricardo.martincoski@datacom.ind.br> ---
> I can reproduce both behaviors on current master:
> - check-package complaining when tab is not used for |xattr
> - xattr being silently ignored by host-makedevs when tab is used for |xattr
> 
> The second one occurs because the tab propagates from the package recipe to
> package/pkg-generic.mk to fs/common.mk and finally to
> output/build/buildroot-fs/device_table.txt and the code that processes this
> file does a strict check:
> line 513 @ package/makedevs/makedevs.c
> if (1 == sscanf(line, "|xattr %254s", xattr)) {
> 
> We could fix this inconsistency by a number of ways:
> 1) change check-package;
> 2) try to come up with a solution in package/pkg-generic.mk to remove leading
> tabs from _PERMISSION. It cannot be a simple $$(strip) because it would remove
> the newlines;
> 3) change makedevs to ignore leading tabs/spaces for xattr (as it already does
> for non-xattr lines). Hackish version to replace the code mentioned above:
>> if (2 == sscanf(line, "%4095s %254s", name, xattr) && !strcmp(name, "|xattr")) {

 1 == sscanf(line, " |xattr %254s", xattr)) should be sufficient - " " matches
any amount of whitespace.

 Note that since the xattr handling is something we added ourselves to busybox
makedevs, we can easily do this.

> 4) change fs/common.mk to remove the leading tabs/spaces. Something like this:
>> +++ b/fs/common.mk
>> @@@ -89,2 -89,2 +89,3 @@@ endi
>>        $(call PRINTF,$(PACKAGES_PERMISSIONS_TABLE)) >> $(FULL_DEVICE_TABLE)
>> ++      $(SED) "s/^[ \t]*//g" $(FULL_DEVICE_TABLE)
>>        echo "$(HOST_DIR)/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
> 
> I think option 4 makes sense because we also will end up with a better
> formatted device_table.txt.

 I prefer option 3 or 4 as well. However, I don't agree that it's better
formatted without the tabs - with the tab in front, it's clearer that the xattr
belongs to the line above. So I'm more inclined to option 3.

 Regards,
 Arnout

> 
> But let's wait for more opinions on how to proceed.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
