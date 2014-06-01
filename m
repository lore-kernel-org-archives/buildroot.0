From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Jun 2014 15:24:41 +0200
Subject: [Buildroot] [PATCH 0/11 v5] Some download-related changes
 (branch yem/check-downloads)
In-Reply-To: <cover.1399204808.git.yann.morin.1998@free.fr>
References: <cover.1399204808.git.yann.morin.1998@free.fr>
Message-ID: <20140601152441.045ec06b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  4 May 2014 14:01:43 +0200, Yann E. MORIN wrote:

> This series contains those download-related changes:

I have one request regarding this series: I would like all the
temporary steps for the download procedures to take place somewhere in
$(O), and then only after the download is completed, do an atomic
rename of the file into $(DL_DIR).

The problem I'd like to solve is that it is currently impossible to
share a download directory between separate, parallel, builds of
Buildroot, because all the builds are going to use $(DL_DIR) as a
temporary location to download things, stepping on each other if the
different builds happen to download the same file at the same time. For
this reason, I had to switch to one download directory per build
instance in the autobuilder.

By downloading all the temporary files in $(O), and then doing an
atomic rename, the other build instances will either see the file and
use it, or not see it, and do the same procedure, with an atomic rename
at the end. Of course, it won't work if the download directory is on a
different filesystem, because the atomic property of file rename is
guaranteed only inside a given filesystem. But still, it's going to be
better than what we have today.

Thoughts?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
