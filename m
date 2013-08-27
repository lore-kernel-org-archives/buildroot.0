From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 21:15:57 +0200
Subject: [Buildroot] [1/1] civetweb: new package
In-Reply-To: <CAG3-AMpi1X5xKO08bE+pfp5Or5qeYWbLiKt33aWBTpqVC4ToTg@mail.gmail.com>
References: <CAG3-AMrakjHihP-_Zr7E4zX=BSs7Ym+Fc8HSVDbQbt11t4K0sQ@mail.gmail.com>
 <20130827203958.2de34c38@skate>
 <CAG3-AMpi1X5xKO08bE+pfp5Or5qeYWbLiKt33aWBTpqVC4ToTg@mail.gmail.com>
Message-ID: <20130827211557.1416d328@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Davis,

On Tue, 27 Aug 2013 14:54:28 -0400, Thomas Davis wrote:
> I will make the suggested changes and retest and re-submit.  To answer
> outstanding questions.
> 
> 1. BR2_LARGEFILE is required by SQLITE3 which is a dependency in the
> LUA support.

Ok. This is something you could potentially address by passing
-DSQLITE_DISABLE_LFS to the Sqlite build when !BR2_LARGEFILE. See
package/sqlite/sqlite.mk in Buildroot. But ok, it's not mandatory to
support this use case for civetweb.

So, what I'd like to see is something like:

config BR2_PACKAGE_CIVETWEB_LUA_SUPPORT
	bool "lua support"
	# required by the bundled sqlite code
	depends on BR2_LARGEFILE
	comment
	  Enable Lua support in Civetweb. Note that this will use a
	  version of Lua and Sqlite bundled within the Civetweb
	  sources, and not the packages from Buildroot.

comment "lua support requires largefile support in toolchain"
	depends on !BR2_LARGEFILE

> 2. DOCUMENT_ROOT is the path from with-in the chroot to the documents
> folder.  This is a value written into a configuration file, not an
> actual directory something gets placed in.  Normally it would have
> been automatically determined by PREFIX, but in the fake root
> situation it has to overridden so it works correctly inside the
> chroot.  It is not an install path itself.

Right, discovered this after having a deeper look at civetweb. Then
please set it to /var/www, which is what we do for other web servers in
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
