From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:40:02 +0200
Subject: [Buildroot] [PATCH v8 03/10] support/scripts: add fix-rpath
 script to sanitize the rpath
In-Reply-To: <a92d7a30-8892-a99f-2165-268c4a3a06d6@grandegger.com>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-4-git-send-email-wg@grandegger.com>
 <20170720224906.301f524a@windsurf>
 <53db2a2d-2211-b173-8e37-19f55afe49de@mind.be>
 <a92d7a30-8892-a99f-2165-268c4a3a06d6@grandegger.com>
Message-ID: <20170721094002.388f4698@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 09:35:14 +0200, Wolfgang Grandegger wrote:

> >>>>>    Sanitizing RPATH in target tree  
> >> /home/thomas/projets/buildroot/support/scripts/fix-rpath target
> >> thomas at windsurf:~/projets/buildroot (master)$
> >>
> >> This is a little bit disturbing, so I believe it should be fixed in a
> >> follow-up patch.  
> > 
> >   Right! That's because the "if ${PATCHELF} ..." just fails and the error is
> > redirected to /dev/null.
> > 
> >   Better check if ${PATCHELF} is executable somewhere in the beginning.
> > 
> >   However, there is never a guarantee. If e.g. it would be missing a shared
> > library, it would still fail in the same way. To be really sure, you'd have do
> > e.g. call patchelf on itself to verify it is actually working.  
> 
> Or you can set "PATCHELF_DEBUG=1" to check what patchelf is doing.

We're not interested in knowing what patchelf is doing. My initial
report is that if the patchelf binary doesn't exist, the script runs
without reporting any error:

 - Nothing on stdout/stderr
 - The script has an exit code of 0

This is not good: the script should at the very least return a non-zero
error code if patchelf isn't available, and should probably display an
error as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
