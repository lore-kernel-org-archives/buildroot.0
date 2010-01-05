From: Ormund Williams <ormundw@panix.com>
Date: Mon, 04 Jan 2010 20:19:30 -0500
Subject: [Buildroot] Qt fails to build
In-Reply-To: <27010092.post@talk.nabble.com>
References: <27010092.post@talk.nabble.com>
Message-ID: <1262654370.7377.29.camel@station1.ormlab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2010-01-04 at 01:43 -0800, alexperl wrote:
> Hello!
> I clone git repo from 1/01 but have same error. Is this bug still
> reproducible? 
Yes.  I'm sorry I haven't gotten around to fixing it yet.  

Find this line in the .../package/qt/qt-4.5.3.mk file:

  BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))

and then add the following lines:

  # x86x86fix
  # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
  # host. It's unclear if this would happen on other hosts.
  ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
  ifeq ($(BR2_PACKAGE_QT_EMB_PLATFORM),x86)
  QT_CONFIGURE+= -platform linux-g++
  QT_CONFIGURE:=$(call qstrip,$(QT_CONFIGURE))
  endif
  endif
  # End of workaround.

When I get back to working on Buildroot I'll send in a patch.

Regards.
-- 
Ormund Williams
OrmLab LLC
