From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 20:08:30 +0200
Subject: [Buildroot] [PATCH 0 of 5 v4 for 2014.08] manual-text
 generation improvements
In-Reply-To: <CAHXCMMLMnxoRo4iXBME92kghZ1QDf0EcU7ZyPBUD38OLLkdNaQ@mail.gmail.com>
References: <patchbomb.1408110033@localhost>
 <20140816093547.666af315@free-electrons.com>
 <CAAXf6LWuy0jVvzNgq9YLvcOwNtWmiVLc6fxWfczBE-DHRBTXug@mail.gmail.com>
 <CAHXCMMJ1YTS7K7tP2aFcDgC8cTGM32C-n4P+jf0r=pVB5zGZ-A@mail.gmail.com>
 <CAHXCMMLMnxoRo4iXBME92kghZ1QDf0EcU7ZyPBUD38OLLkdNaQ@mail.gmail.com>
Message-ID: <20140816200830.4126dada@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sat, 16 Aug 2014 19:24:42 +0200, Samuel Martin wrote:

> When generating the pdf manual, a2x calls dblatex, which calls xsltproc.
> Here is a verbose log [1].
> During its execution, xsltproc checks for template recursion and
> reaches its limit set to 15000 when processing the target
> package-list.txt file (empirically, this limit allows a 1147-entry
> table).
> To raise this limit, a --maxvars option exists in xsltproc program but
> the latest release of libxslt is buggy and this option is not honored.
> :-(
> Hopefully the fix is already merged upstream [2].
> Backporting this patch is enough to get a working xsltproc, but it
> also means that we now need to build host-libxslt (and a .config) to
> build the manual.
> So, to build the manual we have to run:
> $ make defconfig && make host-libxslt manual
> 
> The main drawback of this fix is that building the manual could now
> require building some host-package.
> 
> This also makes echo to the include statement of the *.mk files
> without having a .config file discussion.
> 
> Anyway, I will prepare a series fixing this, though it is not a
> mandatory for the release
> 
> Note that we have already released a couple of Buildroot versions
> without recieving any complaint about this.

I'm not sure we should enforce building host-libxslt as a dependency of
the manual. Maybe just check the version of xsltproc and bail out with
an error message if it's not the appropriate version. I believe most
people are just using the pre-generated versions of the manual that are
online on Buildroot website. So it's up to us to have the appropriate
xsltproc version there.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
