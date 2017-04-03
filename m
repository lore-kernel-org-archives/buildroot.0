From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Apr 2017 17:08:46 +0200
Subject: [Buildroot] [PATCH v4 1/2] arch: add BR2_READELF_ARCH_NAME
 hidden config option
In-Reply-To: <eb0947cc-a940-9edc-a6fd-d324337f6568@mind.be>
References: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170320222656.38163a70@free-electrons.com>
 <0u07rdxu5j.ln2@ID-313208.user.individual.net>
 <20170402143020.06ef773c@free-electrons.com>
 <eb0947cc-a940-9edc-a6fd-d324337f6568@mind.be>
Message-ID: <20170403170846.397bfbf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Apr 2017 16:24:55 +0200, Arnout Vandecappelle wrote:

>  So, let me get this clear: libmpeg2 actually does the right thing, and it is in
> fact possible to link the Sparc v8+ library with Sparc libraries?

It's not so much that you can link Sparc v8+ code with Sparc code that
is important:  you can link ARMv5 and ARMv7 code together, but running
ARMv7 code on ARMv5 still doesn't make sense.

And "Sparc v8+" on regular Sparc like we support is not going to work.
However, what is important here is that libmpeg is smart enough to not
call into the Sparc v8+ code if we're not on Sparc v8+.

It's exactly like having SSE3 code built-in, and testing at runtime if
SSE3 is enabled before calling the SSE3 specific code. In a Buildroot
context where we normally build for specifically the target system,
this shouldn't be necessary, but some software packages do this anyway.

>  In that case, I guess we should extend check-bin-arch to support regexes for
> the expected arch, and set the BR2_sparc arch to "Sparc( v8+)?".

Not as simple: another package may generate Sparc v8+ code, and this
would be bogus.

So, in the context of Buildroot, I believe we should rather patch
libmpeg to not generate the Sparc v8+ code if we are not on Sparc v8+.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
