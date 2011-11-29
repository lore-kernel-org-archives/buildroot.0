From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Nov 2011 08:31:31 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111122230429.2bef52c2@skate>
 <005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98>
 <20111122232914.76a86e7d@skate>
 <006101cca967$050bb240$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com>
 <001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
 <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
 <20111128161124.0f95d0d4@skate>
 <001f01ccade1$204918d0$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
 <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
Message-ID: <20111129083131.77889c21@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 28 Nov 2011 10:14:58 -0600,
"Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :

> Because I don't want just the default source of EtherCAT built into
> the Linux image.  Lets say I want to modify something in the examples
> directory of EtherCAT.  For instance, I had to modify the sample code
> and rebuild.  So what I want is this "rebuilt" version of EtherCAT,
> with customized example code, as part of the Linux image.  If I point
> at the EtherCAT website, that won't be the correct version.  The
> EtherCAT examples development will occur on the same machine that
> Buildroot is on, hence why I like the local filesystem solution.

I am not sure what you are trying to achieve here. If the upstream
package has issues that need to be fixed, then you can put patches in
the package/ethercat/ directory, which Buildroot will apply after
extracting the upstream tarball.

In addition, if you want to do quick development on EtherCAT, you can
also use the new "source override" feature that is part of the
upcoming Buildroot 2011.11. With this feature, you can tell Buildroot
to use a local directory for the source code instead of an upstream
tarball without changing the package .mk file itself, so that the .mk
file remains usable for upstreaming in Buildroot.

To do this, just create a local.mk file in the top directory of
Buildroot with the following contents :

ETHERCAT_OVERRIDE_SRCDIR = /my/local/place/

and then reference this local.mk file in the BR2_PACKAGE_OVERRIDE_FILE
configuration option.

If you really want to use a local directory directly in the package .mk
file, then you can use

ETHERCAT_SITE = /my/local/place
ETHERCAT_SITE_METHOD = local

But this is not great as it won't allow you to submit Ethercat to the
Buildroot developers, and will also force all users (including in your
company) to have Ethercat available at this location.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
