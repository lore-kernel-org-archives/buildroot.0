From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 May 2016 08:41:09 +0200
Subject: [Buildroot] [PATCH 23/34] pkg-download: allow git+ssh URLs
In-Reply-To: <20160507223904.1217db52@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 7 May 2016 22:39:04 +0200")
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-23-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507223904.1217db52@free-electrons.com>
Message-ID: <87k2j3n37e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 30 Apr 2016 09:49:19 +0200, Gilles Chanteperdrix wrote:
 >> ---
 >> package/pkg-download.mk | 2 +-
 >> 1 file changed, 1 insertion(+), 1 deletion(-)

 > This looks good I believe, so please resend with your SoB line. Maybe
 > an update to the Buildroot manual is also needed.

I'm not sure we want to advertise this feature too much (or at least
mention it is deprecated). I've personally not heard about git+ssh://,
and googling around I didn't find anything right away.

The only reference I have found is in the git source code:

static enum protocol get_protocol(const char *name)
{
	if (!strcmp(name, "ssh"))
		return PROTO_SSH;
	if (!strcmp(name, "git"))
		return PROTO_GIT;
	if (!strcmp(name, "git+ssh")) /* deprecated - do not use */
		return PROTO_SSH;
	if (!strcmp(name, "ssh+git")) /* deprecated - do not use */
		return PROTO_SSH;
	if (!strcmp(name, "file"))
		return PROTO_FILE;
	die("I don't handle protocol '%s'", name);
}

So the question is how long git will continue to support it.

With that said, I don't have a problem with us detecting git+ssh:// (and
perhaps ssh+git://) as git URLs and forwarding it to the download
wrapper - But if we start documenting it as supported we should continue
to do so, so we might end up having to rewrite git+ssh:// -> ssh:// URLs
and so on when/if git stops supporting them natively.

-- 
Bye, Peter Korsgaard
