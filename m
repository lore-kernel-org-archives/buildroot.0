From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Jul 2017 17:10:43 +0200
Subject: [Buildroot] [PATCH 1/1] host-mariadb: add host-openssl
 dependency
In-Reply-To: <20170727133548.30285-1-aduskett@gmail.com>
References: <20170727133548.30285-1-aduskett@gmail.com>
Message-ID: <20170727171043.076dd40d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Jul 2017 09:35:48 -0400, Adam Duskett wrote:
> On Fedora26, openssl 1.1.x is included by default.  This causes build errors
> when building the host variant of mariadb. Adding host-openssl as a dependency
> fixes this issue.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

I don't think this is the correct fix. Indeed, host-mariadb builds just
fine on a system where the OpenSSL headers/development files are *NOT*
installed.

This means that host-mariadb does not require host-openssl, but uses
OpenSSL if available. So the proper solution is to pass some option at
configure time to tell host-mariadb to not attempt to use OpenSSL.
Indeed, we are not really interested in having OpenSSL support in
host-mariadb.

It apparently needs an SSL implementation, but has a small bundled one
based on yassl. Can you try:

HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled

and see if it fixes the problem for you ?

You can try to compare the build time of host-mariadb + host-openssl
vs. host-maria-db + bundled SSL.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
