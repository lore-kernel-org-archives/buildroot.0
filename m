From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 22:09:08 +0200
Subject: [Buildroot] [RFCv1 08/11] package: package-based implementation
 of source, external-deps and legal-info
In-Reply-To: <CAAXf6LXvWgtX4h_2NH6=zOiaDyXLmzRoAfviaTwbmTdMFKvoyg@mail.gmail.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LXvWgtX4h_2NH6=zOiaDyXLmzRoAfviaTwbmTdMFKvoyg@mail.gmail.com>
Message-ID: <20130915220908.3d826b82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 15 Sep 2013 21:29:58 +0200, Thomas De Schampheleire wrote:

> >  TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
> > -TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
> > +TARGETS_SOURCE:=$(patsubst %,%-all-source,$(TARGETS) $(BASE_TARGETS))
> 
> Am I correct in understanding that, due to the full dependency chain,
> TARGETS_SOURCE will have many duplicate entries?

Well, TARGETS_SOURCE itself will not have many duplicate entries: in
the TARGETS variable, each selected package is only mentioned once, and
TARGETS_SOURCE has the exact same number of entries as TARGETS, except
that each word in TARGETS is replaced by %-all-source (I'm excluding
BASE_TARGETS here, but it only ever contains one entry: 'toolchain').

However, when *evaluating* those targets, we will indeed be looking
multiple times at the same dependencies.

> When executing 'make source', then, each of these targets will be
> executed multiple times, correct? Even though the actual download will
> only be executed once for each package, I wonder if there can be other
> side effects by executing the targets multiple times. Would it make
> sense to do $(shell sort -u ... ) here?

As explained above, no: TARGETS_SOURCE by itself does not contain any
duplicated entry. It's the fact of evaluating each target in
TARGETS_SOURCE that will lead to looking multiple times at the same
things. But I'm not sure how to solve that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
