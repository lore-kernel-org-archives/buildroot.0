From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 08:56:44 +0100
Subject: [Buildroot] [PATCH v2 2/2] python3: Bump version to 3.6.0
In-Reply-To: <CAHQ1cqFB2UnahiSC_hL7Enu1L2jtNV7ZGQt7AKMLzCU9tyKwgw@mail.gmail.com>
References: <20170314234228.3744-1-andrew.smirnov@gmail.com>
 <20170314234228.3744-2-andrew.smirnov@gmail.com>
 <20170319155314.3ca86764@free-electrons.com>
 <CAHQ1cqFB2UnahiSC_hL7Enu1L2jtNV7ZGQt7AKMLzCU9tyKwgw@mail.gmail.com>
Message-ID: <20170322085644.516eecfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 17:49:06 -0700, Andrey Smirnov wrote:

> > To be honest, I find it really annoying that we have to do this to find
> > the name of the sysconfigdata package. I've thought about the following:
> >
> >  - Have the Python build system output somewhere the name of the
> >    sysconfigdata module that has been generated.
> >  
> 
> Sure, you can do that, but that would mean another custom patch
> against CPython's build system which is very likely to break and
> require manual intervention next time there's at least a major version
> update. After going through all of BR's patches in the process of
> rebasing on 3.6 and having to manually fix at least half of them I
> didn't want to make the problem worse, so that's why I didn't go that
> route.

OK, makes sense. It's always a matter of tradeoff anyway.

> I don't think this would work. CPython's build system does not use
> -dumpmachine output directly to come up with that suffix and instead
> relies on specially crafted dummy .c file and CPP:
> 
> https://github.com/python/cpython/blob/master/configure.ac#L762
> 
> So for example on my target -dumpmachine would result in
> "powerpc-e500v2-linux-gnuspe", where as suffix of sysconfigdata would
> be "powerpc-linux-gnuspe".

OK, in this case indeed your approach is the best option I'd say.

> > Why are all patches you have changed now re-assigned with your From?
> > You should preserve the authorship of the original author.
> >  
> 
> Because I manually applied those patches and committed them in my
> local CPython repo and didn't go out of my way to prevent "From" from
> being set to committer when I git format-patch'ed them, since the
> authorship/copyright information is preserved in "Signed-off-by"
> lines. Will change in v3.

Since all patches are Git formatted, you can (and should) apply them
with "git am" which will preserve all this information automatically.

> >>  # Provided to other packages
> >> -PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
> >> +PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/  
> >
> > Why do we now need
> > $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ ?  
> 
> Because that's where _sysconfigdata_m_linux_*.pyc file is located.

OK. I thought "but isn't this in the default Python search path", but
in fact it's going to be in the default search path on the target, but
not when cross-compiling. So: OK.

Thanks for all those explanations!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
