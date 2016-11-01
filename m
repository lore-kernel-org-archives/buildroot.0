From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 15:56:07 +0100
Subject: [Buildroot] [PATCH] owfs: install python bindings in the
 correct location
In-Reply-To: <990f7aa3-b4ac-5ef1-a325-155df1e821bf@mind.be>
References: <20161101141448.14792-1-arnout@mind.be>
 <20161101153620.3b040c9f@free-electrons.com>
 <990f7aa3-b4ac-5ef1-a325-155df1e821bf@mind.be>
Message-ID: <20161101155607.5b80018b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Nov 2016 15:51:09 +0100, Arnout Vandecappelle wrote:

> > Could we instead introduce a OWFS_MAKE_OPTS variable? Yes, that's a
> > slightly larger change, but it's our usual pattern to handle such
> > situations, so I'd prefer to have it handled like this in owfs as well.  
> 
>  You mean:
> 
> OWFS_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
> 
> and then outside of the condition:
> 
> OWFS_MAKE = $(MAKE) $(OWFS_MAKE_OPTS)

Yes, considering what we have in the autotools package infrastructure
right now.

However, I find our usage of those variables in the infrastructure a
bit weird:

 - We use <pkg>_MAKE_OPTS only during the build

 - We use <pkg>_INSTALL_{TARGET,STAGING}_OPTS at install time, with a
   default value of DESTDIR=$(..._DIR) install, which has sometimes
   caused some issues as people forgot about it.

Maybe we should use <pkg>_MAKE_OPTS also at install time?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
