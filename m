From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:27:31 +0200
Subject: [Buildroot] [PATCH] Revert "package/skeleton-custom: also check
 for missing directories"
In-Reply-To: <20170809161005.3874-1-yann.morin.1998@free.fr>
References: <20170809161005.3874-1-yann.morin.1998@free.fr>
Message-ID: <18ca8a9d-9d07-8763-05eb-cbe9ef1dfcc6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09-08-17 18:10, Yann E. MORIN wrote:
> This partially reverts commit cf6d321e9d5c9dec63e42466fec4bf5de5853bd3.
> 
> The underlying reason for doing the checks is to ensure that a
> merged-usr setting is properly enforced, even for custom skeletons.
> 
> Before that patch, a custom skeleton where both /bin and /usr/bin were
> missing was accepted; but then the first package that intalled something
> in /bin would create it as a directory, thus breaking the merged-usr
> situation. Ditto sbin and lib, of course.
> 
> cf6d321 was created to detect that situation, and the fix was to require
> that both directories do exist in the custom skeleton, so that we new
> the check for consistency were OK, in all cases.
> 
> However, that broke existing skeletons which where missing both
> directories, and some people are shinning about it...
> 
> The crux of the problem is that Buildroot should be responsible for
> creating the directories or the symliks when they are missing, and only
> fail if the existing ones are incorrect, but not impose the burden on
> the user.
> 
> A situation where the problem arises is when a skeleton is shared
> between various builds, some using a merged-usr while other do not.
> 
> We fix that by reverting the offending changes change, back to the
> previous behaviour. We keep the stderr redirection in stat calls, and
> the variable renaming.

 So I didn't split the patch up sufficiently :-)


> A proper fix to create the missing directories can be added later.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

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
