From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Sat, 11 Apr 2020 12:40:19 +0300
Subject: [Buildroot] [PATCH 0/0] buildroot printing fault
Message-ID: <20200411094022.13773-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are multiple issues in buildroot that faults cups printing.

First trouble is incorrect qpdf buiding.
Qpdf is mandatory dependence of cups.
In current master, qpdf builds with incorrect --no-random option. On 
any work< qpdf send 'no such file' error. For example:
qpdf /usr/share/cups/data/secret.pdf -

This commmand must get PDF file in stdout.But only 'No such file or
 directory' error present.

0/1 patch fix this by changing configure options to 
with-random=/dev/random.

Next global problem - cups-filters need ghostscript.
From  https://github.com/OpenPrinting/cups-filters/blob/master/README :
By default, pdftops uses Ghostscript if this does not get changed
    at compile time, for example by the Linux distribution vendor.

0/2 patch fix id by settinbg ghostscript as default render if 
ghostscript enabled in voard config.

Last trouble - ghostscript building without cups support.

0/3 patch fix is by removing disable-patch option. Now, if cups is 
enabled, it will be added to dependencies and correct configure 
options added to ghostscript building. Also fixed ghostscript 
buildroot building issue with unpleasant hack in configure.ac, which 
broke pkg-config. It's broke cups search by ghostscript configure 
script.
GHOSTSCRIPT_CUPS_CONFIG_FIX also needed for this task.

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
