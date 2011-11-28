From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 28 Nov 2011 13:24:35 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
Message-ID: <201111281324.38619.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon November 28 2011, Jeff Krasky wrote:
> > Try a "make clean" then try again.
> > The missing file was reported to be the downloaded (*/dl/* directory)
> > the system may have that marked as already downloaded.
> 
> >>> ethercat 1.0 Downloading
> file:///home/user1/Desktop/EtherCAT4Atmel//etherlabmaster.tar.bz2:
> Unsupported scheme "file".
> >>> ethercat 1.0 Extracting
> bzcat: Can't open input file
> /home/user1/buildroot-2011.05/dl/etherlabmaster.tar.bz2: No such file or
> directory.
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> make: ***
> [/home/user1/buildroot-2011.05/output/build/ethercat-1.0/.stamp_extracted]
> Error 2
> user1 at linux-0mmn:~/buildroot-2011.05>
> 
> 
> I did the 'make clean' and now it appears like it doesn't like the "file://"

Try:
"file:///"

> part of things.  Has anyone done it like this?  The website for EtherCAT
> doesn't point directly at a .bz2 file and so I can't do the http:// method.
> 

Check me on this - see if I am following your description -
The site:
http://etherlab.org/en/components.php

Has a multiple component download file:
http://etherlab.org/download/bundle/etherlab-bundle-1.4.tar.bz2

That should be your download site and download package name.

Inside the bundle, it has directory trees of (among other things):
etherlab-bundle-1.6/2_rtal/linux-2.6.24.7.tar.bz2
etherlab-bundle-1.6/2_rtal/rtal-3.6.2.tar.bz2
etherlab-bundle-1.6/3_ethercat-1.4.0.tar.bz2
etherlab-bundle-1.6/5_etherlab/etherlab-1.2-rc4.tar.gz
etherlab-bundle-1.6/8_examples/example.mdl
etherlab-bundle-1.6/8_examples/example.sml
......

and you want to extract, patch, and build __some__ of the contained
archives (or, for examples, some of the files)....

Although I haven't done this myself, I do recall reading on the M.L.
here that there is a way in Buildroot to define a "custom extract"
(or download) step (or script?) -
That should be able to handle such an ugly package structure.

I think all it has to do is download the bundle of archives,
open just the outer bundle and mark each of the contained archives
as having been downloaded.  I __think__.

With the contained archives now downloaded (by extracting from the
containing package) the BR system should be able to return to running
the "extract,..." steps of each of the make files for each contained archive.

If that is what you need to do - one of the experts on the Buildroot
infrastructure needs to chime in with a "how to" here.  ;-)

Mike
> Thanks.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
