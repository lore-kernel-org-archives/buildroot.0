From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 09:59:50 +0100
Subject: [Buildroot] [PATCH v2] rabbitmq-c: link against zlib and libintl
In-Reply-To: <1453970725-12387-1-git-send-email-joris.lijssens@gmail.com>
References: <1453970725-12387-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160128095950.6960050d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joris Lijssens,

On Thu, 28 Jan 2016 09:45:25 +0100, Joris Lijssens wrote:
> When building the amqp toolset and static linking is enabled, the
> rabbitmq-c library needs to explicity link against zlib and libintl
> 
> Fixes:
> http://autobuild.buildroot.net/results/2ef/2ef1ed958db8012224f9174334e9c58edace604a/
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>

Hum, I think I already reviewed a similar patch, and said it wasn't
correct, so I still stand on my position that it isn't correct.

If you look at the failure at
http://autobuild.buildroot.net/results/2ef/2ef1ed958db8012224f9174334e9c58edace604a/build-end.log,
rabbitmq-c is *NOT* using zlib or libintl.

What you are seeing is that:

 * libcrypto is using zlib
 * libpopt is using libintl

So rabbitmq-c should *NOT* be changed to link against zlib or libintl.
It should be changed to query OpenSSL (which provides libcrypto) and
popt to know against which libraries to link to use OpenSSL and popt.

See my previous answer on the matter on:

Subject: Re: [Buildroot] [PATCH] rabbitmq-c: link against zlib and libintl
Date: Wed, 20 Jan 2016 10:41:56 +0100

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
