From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Nov 2018 00:15:59 +0100
Subject: [Buildroot] [PATCH v2] libcurl: Allow selection of TLS package
 libcurl will use
In-Reply-To: <1541804005.30311.392.camel@impinj.com> (Trent Piepho's message
 of "Fri, 9 Nov 2018 22:53:25 +0000")
References: <20181108222517.20629-1-tpiepho@impinj.com>
 <89e08627-ea80-393e-53da-c8ab90df66f1@mind.be>
 <878t217u30.fsf@dell.be.48ers.dk>
 <1541804005.30311.392.camel@impinj.com>
Message-ID: <87zhuh6dw0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

Hi,

 >> >  Note that that means that libcurl will by default select openssl, which was not
 >> > the case before. However, I think it makes complete sense to default to enabling
 >> > TLS support in libcurl. Peter, what do you think? This would obviously have to
 >> > be mentioned in the release notes because the behaviour of existing configs
 >> > would change.

 > Don't most optional features in buildroot get auto-enabled when the
 > package they need is enabled?  Which in effect means the feature is
 > turned on, not by a setting under the user, but by turning on the
 > dependency.  I know I've seen this pattern many many times in
 > buildroot.

 > Is this pattern of turning on the dependency via an option under the
 > user of the dependency used elsewhere?  Or would it be a new pattern
 > unique to libcurl?

We use automatic dependencies for most packages, but there are a few
with explicit sub options to pull in the optional dependencies.

 >> Either that or add a:
 >> 
 >> depends on BR2_PACKAGE_OPENSSL || BR2_PACKAGE_GNUTLS || \
 >> BR2_PACKAGE_LIBNSS || BR2_PACKAGE_MBEDTLS
 >> 
 >> To the choice option and drop the _LIBCURL_NONE variant. With that we
 >> have the same behaviour as before, except that you _CAN_ select the TLS
 >> provider in case multiple providers are available.

 > I did drop the NONE variant.  Do you mean in Arnout's alternate
 > example?  It doesn't provide entirely the same behavior.  Example:

 > openssl off, gnutls on

 > Current: libcurl uses gnutls
 > My patch: libcurl uses gnutls
 > Arnout's proposal: libcurl enables openssl and uses it.  Need to change
 > config to select gnutls and turn off openssl.
 > Peter's modification: Same as Arnout's

 > I believe your modification only produces the same behavior in the case
 > where all four tls libs are off.  As soon as one turns on, then libcurl
 > will select openssl.

Correct, so I think it makes sense to use 'depends on' for the
individual sub options like you had. With that, the default behaviour
should be like it was before.

-- 
Bye, Peter Korsgaard
