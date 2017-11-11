From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Nov 2017 11:42:05 +0100
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <5A026567.8070101@petroprogram.com>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
 <5A026567.8070101@petroprogram.com>
Message-ID: <4e2865a3-6656-75a6-4e01-f95935d2d465@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-17 03:01, Stefan Fr?berg wrote:
> 
> 
> 6.11.2017, 23:14, Arnout Vandecappelle kirjoitti:
>> @@ -181,6 +184,28 @@ TARGET_CXXFLAGS += -fstack-protector-all
>> ? TARGET_FCFLAGS += -fstack-protector-all
>> ? endif
>> ? +ifeq ($(BR2_RELRO_PARTIAL),y)
>> +TARGET_CFLAGS += $(TARGET_CFLAGS_RELRO)
>> +TARGET_CXXFLAGS += $(TARGET_CFLAGS_RELRO)
>> +TARGET_FCFLAGS += $(TARGET_CFLAGS_RELRO)
>> ? Since these are linker flags, it _should_ be sufficient to add them to LDFLAGS.
>> There may be some packages that don't listen to LDFLAGS so in that sense it
>> could be a good idea to add it to CFLAGS as well, but I tend to prefer to fix
>> the packages. Only, there is no easy way to detect that LDFLAGS are ignored.
>>
> 
> There could be a way to tell if package shows middle finger to
> CFLAGS/CXXFLAGS/LDFLAGS
> and just ignores the hardening options.
> 
> There's a little perl script called hardening-check that could be used to do
> post installation checking
> of what packages actually respected the flags.
> 
> http://manpages.ubuntu.com/manpages/trusty/man1/hardening-check.1.html
> 
> I have a copy of that perl script here:
> https://www.orwell1984.today/hardening-check

 Yeah, Matthew already proposed to include a (different) hardening check script.
I think that that's a good idea.

[snip]
> Maybe there could be hardened directory with some premade "profiles" (gcc spec
> files) for various arch-lib combos
> which could be selected from menu and then the buildroot cross-compiler would have
> it's `dirname $($HOST_CC) --print-libgcc-file-name`/specs be a just symlink to
> that arch-lib combos like this:
> 
> output/host/lib/gcc/i686-buildroot-linux-uclibc/6.4.0/specs -->
> ../../../../../../hardened/i686/uclibc/specs
> 
> If selecting vanilla, non-hardened toolchain from menu, it would just remove the
> symlink.

 Hm, I think messing with the specs file is making things complicated...

 However, we do have a toolchain wrapper and we could add the hardening options
in there instead of in CFLAGS. One small caveat, however: some packages may not
build at all with some of the hardening options (-pie for example), in
particular bootloaders and kernels are prone to be problematic. Otherwise it
sounds like a viable option though.

> And maybe there could be an option to run hardening-check script at the end of
> installation.

 Yep, certainly.

 Regards,
 Arnout

> 
> Just throwing thoughts around
> -S-
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
