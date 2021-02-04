From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 17:33:39 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: with headers from
 kernel, also override srcdir
In-Reply-To: <890285e2-7d6a-3343-e8a0-772417b266f0@mind.be> (Arnout
 Vandecappelle's message of "Tue, 2 Feb 2021 20:10:40 +0100")
References: <20210127212413.2046623-1-yann.morin.1998@free.fr>
 <890285e2-7d6a-3343-e8a0-772417b266f0@mind.be>
Message-ID: <875z37eqsc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 27/01/2021 22:24, Yann E. MORIN wrote:
 >> When using the headers from the kernel to be built, with the kernel
 >> set to a custom version, and overriding the kernel sources with
 >> LINUX_OVERRIDE_SRCDIR, the linux-headers package is still trying to
 >> download an archive, and fails to validate its hash.
 >> 
 >> What is going on under the hood is that, with _OVERRIDE_SRCDIR, the
 >> _VERSION of a package is set to 'custom'. Furthermore, the variable
 >> BR_NO_CHECK_HASH_FOR is recursively expanded, so its value is only
 >> evaluated when it is needed.
 >> 
 >> For linux-headers, we inherit the values from the linux package, and
 >> the LINUX_HEADERS_VERSION takes the value from the configuration.
 >> 
 >> Thus we end up with the following situation:
 >> 
 >> LINUX_VERSION=custom
 >> LINUX_HEADERS_VERSION=5.10   # For example
 >> BR_NO_CHECK_HASH_FOR=... linux-custom.tar.gz ...
 >> 
 >> And thus the archive downloaded by linux-headers will not match any
 >> exclusion, and since there will most probably not be a hash for it,
 >> the download will fail, as was noticed and reported by Jarkko.
 >> 
 >> But in this case, what we really want is to really use the headers
 >> from the kernel that we build, we do not even want to attempt a
 >> download at all.
 >> 
 >> So, when using the headers from the kernel to be built, we also
 >> propagate the LINUX_OVERRIDE_SRCDIR to linux-headers, so that we
 >> also use the headers from the overridden sources.
 >> 
 >> Furthermore, in that configuration, we explicitly disallow
 >> overriding the linux-headers specifically, as it does not make sense
 >> (even though, if they were overridden to the same location, that'd
 >> be OK, but to simplify the condition, we do not even check for that).

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
