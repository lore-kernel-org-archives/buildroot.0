From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 18:54:36 +0100
Subject: [Buildroot] [PATCH v2 2/5] support/testing: add core tests
In-Reply-To: <20170305160001.GI3671@free.fr>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1488726201-6507-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170305160001.GI3671@free.fr>
Message-ID: <20170305185436.00822de9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 17:00:01 +0100, Yann E. MORIN wrote:

> >  support/testing/tests/core/__init__.py             |   0
> >  support/testing/tests/core/post-build.sh           |  10 ++++
> >  support/testing/tests/core/post-image.sh           |  10 ++++
> >  .../testing/tests/core/rootfs-overlay1/test-file1  | Bin 0 -> 4096 bytes
> >  .../tests/core/rootfs-overlay2/etc/test-file2      | Bin 0 -> 8192 bytes  
> 
> What are those two binary blobs for?
> Why are they binary blobs?
> Can't they be generated locally?

They are just here to avoid some files containing random stuff, we
don't care what they contain. So indeed, they could be generated
instead of stored in the repository.

However, right now, the testing infrastructure doesn't allow a test to
run some custom operations *before* the build is started. But it's
clearly something that will be needed for a significant number of
tests, so we definitely want to add something like that.

> > +#!/bin/sh
> > +echo $1 > ${BUILD_DIR}/post-build.log
> > +echo $2 >> ${BUILD_DIR}/post-build.log
> > +echo $3 >> ${BUILD_DIR}/post-build.log
> > +echo ${TARGET_DIR}  >> ${BUILD_DIR}/post-build.log
> > +echo ${BUILD_DIR}   >> ${BUILD_DIR}/post-build.log
> > +echo ${HOST_DIR}    >> ${BUILD_DIR}/post-build.log
> > +echo ${STAGING_DIR} >> ${BUILD_DIR}/post-build.log
> > +echo ${BINARIES_DIR}  >> ${BUILD_DIR}/post-build.log
> > +echo ${BR2_CONFIG}  >> ${BUILD_DIR}/post-build.log  
> 
> This is ugly, and I guess it will be hard to maintain consistency
> between this list and the checks done in the code.

I wouldn't call it "ugly", but it indeed could be better.

> This does not work well if there are any problematice character in
> there, so I'd at least quote the variables.
> 
> But I would even go further and print key-value pairs to the file:
> 
>     #!/bin/sh
>     printf "what='%s'\n" "${1}"
>     printf "arg2='%s'\n" "${2}"
>     printf "arg3='%s'\n" "${2}"
>     printf "TARGET_DIR='%s'\n" "${TARGET_DIR}"
>     printf "BUILD_DIR='%s'\n" "${BUILD_DIR}"
>     [...]
> 
> And then use a parser [*] to read that file and store the values in an
> associative array (aka dictionnary) in the python code, then you can do
> things like:
> 
>     self.assert(post_log["what"], os.path.join(self.builddir, what))
>     self.assert(post_log["TARGET_DIR"], os.path.join(self.builddir, "target"))
> 
> and so on... Which is much more readable IMHO...
> 
> [*] I don't know which parser, but probably one that can read key-value
> pairs from a file... ;-)  Python experts may help you here... ;-]

Not sure which parser to use here. Perhaps some sort of CSV file is
easier to parse in Python.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
