From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:19:31 +0200
Subject: [Buildroot] [PATCH] elf2flt: add patch to fix ld.real search
 logic
In-Reply-To: <20170813213238.27144-1-thomas.petazzoni@free-electrons.com>
References: <20170813213238.27144-1-thomas.petazzoni@free-electrons.com>
Message-ID: <52471861-e9d8-34c8-b49e-2a58b396a6f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-08-17 23:32, Thomas Petazzoni wrote:
> elf2flt contains a program called ld-elf2flt, which gets installed as
> a replacement for ld, with ld renamed to ld.real. This program
> therefore calls ld.real internally.
> 
> The logic to find ld.real worked fine for:
> 
>  - bin/TARGET_ALIAS-ld
>  - TARGET_ALIAS/bin/ld
> 
> However, it failed badly if bin/SIMPLER_TARGET_ALIAS-ld is used, as
> symlink to bin/TARGET_ALIAS-ld. For example:
> 
> $ ./output/host/bin/arm-buildroot-uclinux-uclibcgnueabi-ld
> /home/thomas/buildroot/buildroot/output/host/bin/../arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
> 
> $ ./output/host/bin/arm-linux-ld
> arm-linux-ld (ld-elf2flt): error trying to exec '/home/thomas/buildroot/buildroot/output/host/bin/ld.real': execvp: No such file or directory
> 
> $ ./output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld
> /home/thomas/buildroot/buildroot/output/host/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: no input files
> 
> This commit fixes that by adding a patch that adjusts the ld-elf2flt
> logic to properly cope with this situation.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Nice catch! I hoped that upstream would have given some feedback already, but
alas...

 Applied to master, thanks.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
