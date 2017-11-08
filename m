From: =?windows-1252?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 08 Nov 2017 04:01:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
Message-ID: <5A026567.8070101@petroprogram.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net



6.11.2017, 23:14, Arnout Vandecappelle kirjoitti:
> @@ -181,6 +184,28 @@ TARGET_CXXFLAGS += -fstack-protector-all
>   TARGET_FCFLAGS += -fstack-protector-all
>   endif
>   
> +ifeq ($(BR2_RELRO_PARTIAL),y)
> +TARGET_CFLAGS += $(TARGET_CFLAGS_RELRO)
> +TARGET_CXXFLAGS += $(TARGET_CFLAGS_RELRO)
> +TARGET_FCFLAGS += $(TARGET_CFLAGS_RELRO)
>   Since these are linker flags, it _should_ be sufficient to add them to LDFLAGS.
> There may be some packages that don't listen to LDFLAGS so in that sense it
> could be a good idea to add it to CFLAGS as well, but I tend to prefer to fix
> the packages. Only, there is no easy way to detect that LDFLAGS are ignored.
>

There could be a way to tell if package shows middle finger to 
CFLAGS/CXXFLAGS/LDFLAGS
and just ignores the hardening options.

There's a little perl script called hardening-check that could be used 
to do post installation checking
of what packages actually respected the flags.

http://manpages.ubuntu.com/manpages/trusty/man1/hardening-check.1.html

I have a copy of that perl script here:
https://www.orwell1984.today/hardening-check

I also did the following little test:
1. First compiled turbovnc against i686-uclibc without any hardening and 
then running
"hardening-check -c output/target/usr/bin/Xvnc" with following results:

output/target/usr/bin/Xvnc:
  Position Independent Executable: no, normal executable!
  Stack protected: no, not found!
  Fortify Source functions: no, only unprotected functions found!
  Read-only relocations: yes
  Immediate binding: no, not found!

2. Then forced the gcc compiler to use hardening features by using GCC 
Spec File, so that
if turbovnc did ignore CFLAGS/CXXFLAGS/LDFLAGS it would still be 
forcefeed the right
hardening options, like this:

- Dump the built-in specs file "$(HOST_CC) -dumpspecs > specs" and then 
edit it
to enable all the hardening stuff
(here's mine for i686-uclibc, forgot to enable stack-protection: 
https://www.orwell1984.today/specs)

- Find location where gcc looks for specs file "dirname $($(HOST_CC)  
--print-libgcc-file-name)"
and move the edited specs file there

- Rebuild turbovnc

- And finally, check "hardening-check -c output/target/usr/bin/Xvnc" 
with following result:

output/target/usr/bin/Xvnc:
  Position Independent Executable: yes
  Stack protected: no, not found!
  Fortify Source functions: no, only unprotected functions found!
  Read-only relocations: yes
  Immediate binding: yes

Here turbovnc built with pie, relro,now and if I would have remember to 
enable stack protection in toolchain,
also with stack protection.

So that's a one way to force & check hardening afterwards. But have to 
admit, not very elegant way.

Maybe there could be hardened directory with some premade "profiles" 
(gcc spec files) for various arch-lib combos
which could be selected from menu and then the buildroot cross-compiler 
would have
it's `dirname $($HOST_CC) --print-libgcc-file-name`/specs be a just 
symlink to that arch-lib combos like this:

output/host/lib/gcc/i686-buildroot-linux-uclibc/6.4.0/specs --> 
../../../../../../hardened/i686/uclibc/specs

If selecting vanilla, non-hardened toolchain from menu, it would just 
remove the symlink.
And maybe there could be an option to run hardening-check script at the 
end of installation.

Just throwing thoughts around
-S-
