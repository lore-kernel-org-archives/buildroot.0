From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jul 2011 00:01:17 +0200
Subject: [Buildroot] Installation of package files in staging and target
Message-ID: <20110712000117.3af73a1a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Currently, each userspace package is allowed to install files in both
the staging directory and the target directory.

Typically, a "program" package will install its program(s) only in the
target directory, while a "library" package will install its library
and headers in the staging directory and in the target directory (the
headers, static libraries and other useless files are removed using
global mechanisms before creating the target filesystem image).

I have just sent a patch that proposes to enable debugging symbols by
default when building packages. This would currently ensure that all
libraries installed in 'staging' have debugging symbols. However,
programs would be built with debugging symbols, but as they are only
installed in 'target', the final binary would still be stripped.

I'd like to propose the following scheme :

 * The packages no longer install files in staging and target
   differently. They just install files.

 * All files are installed in both the staging and the target
   directory, by the package infrastructure.

 * The files in the staging directory are left untouched.

 * Some automatic cleanup is done in the target directory :
    - Stripping of binaries and libraries
    - Removal of static libraries, pkg-config files, header files,
      documentation, etc.
    - Removal of files listed in a per-package <pkg>_REMOVE_TARGET
      variable.

This would make the target directory be a cleaned up and stripped
*subset* of the staging directory. We would therefore have in the
staging directory the libraries *and* binaries with debugging symbols
for all packages.

What do you think about this ?

Of course, this is not something that is going to be implemented right
now. I'm just opening the discussion to see if this makes sense, and if
so, how we could move forward.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
