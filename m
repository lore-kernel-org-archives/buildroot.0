From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:39:22 +0200
Subject: [Buildroot] [PATCH 1/1] libqmi: musl compat
 canonicalize_file_name
In-Reply-To: <1493688546-37339-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493688546-37339-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170504213922.18fc60ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 20:29:06 -0500, Matt Weber wrote:

> ++#ifndef HAVE_CANONICALIZE_FILE_NAME
> ++#include <limits.h>
> ++#include <string.h>
> ++#include <stdlib.h>
> ++#include <stdio.h>
> ++static char * canonicalize_file_name(const char *path)
> ++{
> ++       char buf[PATH_MAX] = { };
> ++
> ++       snprintf(buf, sizeof(buf) - 1, "%s", path);
> ++
> ++       if (!realpath(path, buf))
> ++               return NULL;
> ++
> ++       return strdup(buf);
> ++}
> ++#endif

This has been insufficiently tested: while it fixes the build with
musl, it breaks the build with glibc and uclibc. Indeed, those C
libraries already provide canonicalize_file_name(), causing a
redefinition error.

You forgot to add an AC_CHECK_FUNCS() check in configure.ac. I've
committed a fix that adds it.

Please try to test more carefully the fixes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
