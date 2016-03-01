From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 11:40:26 +0100
Subject: [Buildroot] [PATCH] sox: disable SSP when using MIPS Codescape
	toolchains
In-Reply-To: <20160229210827.18465518@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 29 Feb 2016 21:08:27 +0100")
References: <1456763982-36511-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160229175158.3c01895a@free-electrons.com>
 <56D47948.9020505@imgtec.com>
 <20160229210827.18465518@free-electrons.com>
Message-ID: <877fhmmqg5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Mon, 29 Feb 2016 17:00:56 +0000, Vicente Olivert Riera wrote:

 >> Uhm..., how would you do that? BR2_TOOLCHAIN_HAS_SSP is selected by
 >> BR2_TOOLCHAIN_USES_GLIBC. We would need to do changes in the toolchain
 >> infra in order to not define it in that place, and define it
 >> individually for every toolchain. Is that what you mean?

 > Yes, this is what I mean. It is indeed more work, but looks cleaner IMO.

Agreed. This kind of toolchains are probably quite rare. If we want to
keep the number of changes to a minimum we could perhaps handle them
using a negative symbol:

config BR2_TOOLCHAIN_WITHOUT_SSP
       bool

..

config BR2_TOOLCHAIN_USES_GLIBC
       ..
       select BR2_TOOLCHAIN_HAS_SSP if !BR2_TOOLCHAIN_WITHOUT_SSP


And then select BR2_TOOLCHAIN_WITHOUT_SSP from the affected external
toolchains.

But it's quite ugly.

-- 
Bye, Peter Korsgaard
