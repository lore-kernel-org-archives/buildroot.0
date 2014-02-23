From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 18:40:32 +0100
Subject: [Buildroot] [PATCH v2 1/2] infra: Add generic check_prog_host
 function
In-Reply-To: <1393172261-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393172261-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140223184032.2c6d08de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 23 Feb 2014 17:17:40 +0100, Maxime Hadjinlian wrote:

> +# Verify that which is installed
> +check_prog_host "which"

Since your function check_prog_host uses which to determine if the
program exists, isn't it weird to use which to verify it?

Your check_host_prog function could also be used in:

# Check that a few mandatory programs are installed
missing_progs="no"
for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
        if ! which $prog > /dev/null ; then
                echo "You must install '$prog' on your build machine";
                missing_progs="yes"
                if test $prog = "svn" ; then
                        echo "  svn is usually part of the subversion package in your distribution"
                elif test $prog = "hg" ; then
                        echo "  hg is usually part of the mercurial package in your distribution"
                elif test $prog = "zcat" ; then
                        echo "  zcat is usually part of the gzip package in your distribution"
                elif test $prog = "bzcat" ; then
                        echo "  bzcat is usually part of the bzip2 package in your distribution"
                fi
        fi
done

if test "${missing_progs}" = "yes" ; then
        exit 1
fi

Though you see that this loop has this missing_progs variable that
allows to list all the missing programs, and only abort at the end.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
