From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 Mar 2013 22:42:41 +0100
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <20130228095645.2cdfffd6@skate>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be> <20130228095645.2cdfffd6@skate>
Message-ID: <513120D1.1000201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>    Just a couple of generic remarks, and then a few specific ones
>> below. The generic remarks are probably for follow-up patches.
>>
>> * It really doesn't make sense to build host-gdb without a gdbserver
>> for the target. So I would auto-select gdbserver from host-gdb.
>
> See the point made by James Hogan regarding kgdb. I don't have a strong
> opinion on this one, and we could decide that gdbserver is lightweight
> enough that even with James use case of kgdb, it still makes sense to
> have gdbserver on the target when host-gdb is enabled.

  Running a remote kgdb is something you would need the most on a system 
with little memory, so indeed the non-gdbserver use case is important.
So, keep it as you have it.


>> * Does it really make sense to keep options for four different gdb
>> versions? Can't we just remove the user-selectable version completely?
>
> I just kept as it was.

  As I said: for a follow-up patch.

  James Hogan makes another good point that custom patches against a 
specific gdb version are easier to maintain if the version is selectable. 
However, when the generic package infrastructure is used, changing the 
version number directly in gdb.mk is also easy. I think the use case of 
custom patches against gdb is sufficiently rare that Kconfig 
configuration is not needed.


>> * Do gdb-7.2+ actually work for avr32? If yes, why keep the 6.7.1
>> around?
>
> I also just kept it as it was. If we want to upgrade gdb for avr32,
> then let's do it as a follow-up. People having access to avr32 hardware
> should test that.

  Actually, I mean: there is an avr32-specific gdb version, but the 7.x 
gdb versions are also enabled for avr32. It just looks strange.


>>> ---
>>> It would be good to have a few people testing this before
>>> committing.
>>
>>    Nah, just let the autobuilders do it :-)
>
> Autobuilders are nice, but they are not yet capable of starting
> gdbserver on the target, connect gdb, and verify that it works :)

  True, but the change you make here is not going to affect gdb runtime. 
The likelihood that there is serious build breakage is much higher than 
that of a runtime regression, I think. Also if there is a runtime 
regression, the chance that it will be found is much higher if it's been 
committed than if the patch is just lingering on the list.


>>> +	  For embedded development, the most common solution is to
>>> +	  build only 'gdbserver' for the target, and use a
>>> cross-gdb
>>> +	  on the host. See BR2_PACKAGE_HOST_GDB to enable one.
>>
>>    "See BR2_PACKAGE_HOST_GDB in the Toolchain menu to enable one."
>>
>>    It could be useful to add a comment that external toolchains often
>> provide gdb/gdbserver.
>
> Indeed. I am not sure what do with external toolchains here. In the
> past, I was hiding the option to build host-gdb and gdbserver for
> the target, making the assumption that the external toolchain already
> have those, and instead there was the option to copy the toolchain's
> gdbserver to the target. Now, everything is available: host-gdb built
> by Buildroot, gdbserver built by Buildroot, and gdbserver copied from
> the external toolchain. Should I keep all this?

  You could make the gdbserver copied from the external toolchain 
mutually exclusive with the gdb package, but I'm not convinced that that 
is needed.


> Also, the "gdbserver build by Buildroot" thing is in Packages ->
> Debugging, but the "copy gdbserver from toolchain" thing is in
> Toolchain. But it's not easy to put it in a package, as the code needed
> to copy gdbserver from the toolchain really relates to all the complex
> external toolchain logic.

  Well, the location of the config menu is independent from where it is 
used in the .mk files, of course.

  Wild idea:

In Toolchain menu, under all the rest:

  [ ] Cross gdb for the host
      GDB debugger version (gdb 7.5.x)  -->
  [ ] gdbserver on the target
  [ ]   Copy external toolchain gdbserver to the target
  [ ] full gdb on the target


  Hm, this looks very much like the current situation :-)

  Admittedly, gdb's Config.in would look pretty non-standard (e.g. a 
blind BR2_PACKAGE_GDB symbol that is selected by 
BR2_PACKAGE_GDB_GDBSERVER and BR2_PACKAGE_GDB_DEBUGGER), but it is a 
fairly special case.

[snip]
>>    Can we rely on host-nurses being present? It is not checked in
>> dependencies.sh AFAIK. Admittedly, it is not a dependency of host-gdb
>> now, but most people have ncurses installed anyway for menuconfig...
>
> host-ncurses wasn't a dependency, and our host-ncurses package is only
> here to build a version of "tic" that works properly. Some systems had
> a "tic" version causing problems when building a more recent ncurses
> for the target. I think that other than for this "tic" program, we
> should really on the pre-installed ncurses library, which should
> already be present since the user uses menuconfig.

  I guess even better would be a build-if-missing approach like for tar 
and python (when the patch gets merged).

>
> However, it's true we don't check it in dependencies.sh, and the user
> could very well be using xconfig or gconfig, neither of which require
> ncurses.
>
> I'd say that's a separate matter really.

  Agreed. This patch is just an opportunity to review gdb in general.

>
>> [snip]
>>> +define GDB_REMOVE_UNNEEDED_FILES
>>> +	$(RM) -rf $(TARGET_DIR)/usr/share/gdb
>>> +endef
>>
>>    Perhaps a comment why this is needed? Or is it just to keep it
>> consistent with the current behaviour?
>
> The old gdb installation logic was to manually copy the gdb binary to
> the $(TARGET_DIR). In my patch, I've chosen to use 'make install'
> instead, which requires removing a bunch of generally useless stuff
> (Python scripts and XML descriptions of targets, which as per my
> understanding, are needed only when you do remote debugging).

  Fair enough. I feel something like this is worthwhile to explain in a 
comment.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
