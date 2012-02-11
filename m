From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 17:57:20 +0100
Subject: [Buildroot] [PATCH 1 of 2 v3-resend] Makefile.package.in: add
	utility functions find*clauses and notfirstword
In-Reply-To: <47a9c088ed0bfaeaaef3.1328818169@beantl019720>
References: <patchbomb.1328818168@beantl019720>
 <47a9c088ed0bfaeaaef3.1328818169@beantl019720>
Message-ID: <201202111757.20786.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 09 February 2012 21:09:29 Thomas De Schampheleire wrote:
> +# Utility functions for 'find'
> +# findfileclauses: creates "-name 'X' -o -name 'Y'"
> +# [1:namelist]
> +findfileclauses=-name '$(firstword $(1))' $(patsubst %,-o -name '%',$(call notfirstword,$(1)))
> +# finddirclauses: creates "-path 'basedir/dirX' -o -path 'basedir/dirY'"
> +# [1:basedir, 2:namelist]
> +finddirclauses=-path '$(1)/$(firstword $(2))' $(patsubst %,-o -path '$(1)/%',$(call notfirstword,$(2)))
> +
> +# Miscellaneous utility functions
> +notfirstword=$(wordlist 2,$(words $(1)),$(1))
> 

 You asked for inspiration on how to simplify this; here are two (untested) ideas:

- a function 'join':

# join,<joinstr>,<wordlist>: puts <joinstr> between the words of <wordlist>
# e.g.: $(call join,+,a b c) -> a + b + c
join = $(firstword $(2)) $(addprefix $(1) ,$(call notfirstword,$(2))

findfileclauses = $(call join,-o,$(patsubst %,-name '%',$(1))

- strip the first -o after joining:
findfileclauses = $(call notfirstword,$(patsubst %, -o -name '%',$(1)))
finddirclauses = $(call notfirstword,$(patsubst %, -o -path '$(1)/%',$(2)))


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
