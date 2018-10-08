From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 8 Oct 2018 21:21:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008163233.GH2869@scaer>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <20181008180230.53ab7972@windsurf> <20181008163233.GH2869@scaer>
Message-ID: <9062fe55-2457-66bf-48cc-74e787d95129@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/10/18 18:32, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-10-08 18:02 +0200, Thomas Petazzoni spake thusly:
>> On Mon,  8 Oct 2018 13:51:46 +0200, Lothar Felten wrote:
>>> Patch dtc to accept libfdt include guards with and without leading underscore.
>>> A compiler warning is added to notify the user.
>>>
>>> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
>>
>> So I guess this would fix the problem when host-dtc is built before
>> some old Linux/U-Boot version.
>>
>> However, I suppose it doesn't fix the problem when you have a
>> recent version of libfdt installed on your system (through your
>> distribution), that doesn't play well with those older Linux/U-Boot
>> versions. Correct ?
> 
> Probably not, indeed, but that is still better (IMHO) than the few hacks
> we already tried with -isystem or the likes, which do not really work
> either...

 As far as we tested it, [1] *does* really work.

 However, it doesn't fix the issue for U-Boot because there the build system is
really broken: it misses the necessary -I to include the internal libfdt.h, so
only the fdt_host.h that explicitly includes ../include/libfdt.h uses the
internal one; other includes use <libfdt.h> so the host-provided one. So U-Boot
before v2018.03 is just broken beyond repair.

 Note that this patch will solve the problem for the time being. However, as
soon as dtc's libfdt.h contains some declaration that is incompatible with the
one in U-Boot pre-2018.03, U-Boot will break again.

 A possibly more fundamental workaround for U-Boot could be to pass
-I$(UBOOT_SRCDIR)/include in HOSTCC, but that has the potential to introduce
additional breakage...

 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/964474/

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
