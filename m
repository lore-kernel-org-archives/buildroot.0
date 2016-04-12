From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 12 Apr 2016 12:16:47 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-04-11
In-Reply-To: <20160412063023.99284102755@stock.ovh.net>
References: <20160412063023.99284102755@stock.ovh.net>
Message-ID: <570CD91F.5010504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 12/04/16 07:30, Thomas Petazzoni wrote:
> Build statistics for 2016-04-11

>     mips64el |                   stunnel-5.31 | NOK | http://autobuild.buildroot.net/results/b5d7902ac070c66bb39fa17579628f814d95c11d/

the error looks like this:

prototypes.h:628:5: error: conflicting types for 'getnameinfo'

This is because getnameinfo() is redefined. It's already provided by the
toolchain, and stunnel tries to provide it as well.

The configure script checks if the toolchain already provides
getnameinfo() in order to not redefine it. So, why that check doesn't work?

It doesn't work because when the compiler is called in order to perform
the check, some unsupported flags are passed to it. The offending flags
are the ones related to stack smashing protection, which is unsupported
in the IMG Codescape toolchain used in that build. Then the check fails
due to that reason, and stunnel thinks that the toolchain doesn't
provide getnameinfo() therefore it defines its own.

So, the real problem is that stunnel thinks the toolchain has SSP
support when it actually doesn't have it.

The following patch fixes the problem:

http://patchwork.ozlabs.org/patch/597701/

Regards,

Vincent.
