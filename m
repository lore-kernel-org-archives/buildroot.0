From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 01 Jun 2015 22:32:00 +0200
Subject: [Buildroot] [PATCH 2/2] arch: tidy up binary formats config
In-Reply-To: <1432227249-15345-2-git-send-email-guido@vanguardiasur.com.ar>
References: <1432227249-15345-1-git-send-email-guido@vanguardiasur.com.ar>
 <1432227249-15345-2-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <556CC140.6000001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/21/15 18:54, Guido Mart?nez wrote:
> Instead of blacklisting architectures when deciding the binary format,
> let's have each one select the binary formats it supports. The
> preferred default is ELF, then FDPIC, and finally FLAT.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

 In the kernel, we simply have:

config BINFMT_ELF
	depends on MMU

config BINFMT_ELF_FDPIC
	depends on (BLACKFIN || (SUPERH32 && !MMU))

config BINFMT_FLAT
	depends on !MMU

(removed the parts that are not relevant for us).

 So for the ELF and FLAT options, I'd just make it depend on USE_MMU. For FDPIC
it makes sense to keep this patch.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
