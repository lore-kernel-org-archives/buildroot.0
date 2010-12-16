From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 Dec 2010 22:34:18 +0100
Subject: [Buildroot] [PATCH 47/55] linux: support a space-separated list
	of patches
In-Reply-To: <1baf7aad49e6e48e95506af55611e18d70e4209d.1291582352.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 5 Dec 2010 21:53:18 +0100")
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<1baf7aad49e6e48e95506af55611e18d70e4209d.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878vzph06d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The kernel being a component that often needs a fairly important set
 Thomas> of changes to be adapted to a particular hardware platform, having
 Thomas> maximum flexibility on the patching process is a nice
 Thomas> thing. Therefore, as per the discussions from the Buildroot Developer
 Thomas> Day, we add a mechanism to apply a list of patches (that could come
 Thomas> either from URLs, local files or local directories).

 Thomas> +	for p in $(LINUX26_PATCH) ; do \
 Thomas> +		if echo $$p | grep -q -E "^ftp://|^http://" ; then \
 Thomas> +			toolchain/patch-kernel.sh $(@D) $(DL_DIR) `basename $$p` ; \
 Thomas> +		elif test -d $$p ; then \
 Thomas> +			toolchain/patch-kernel.sh $(@D) $$p linux-\*.patch ; \
 Thomas> +		else \
 Thomas> +			toolchain/patch-kernel.sh $(@D) `dirname $$p` `basename $$p` ; \
 Thomas> +		fi \

It would be a bit more efficient to do it in shell with a case
statement, E.G.:

case "$$p" in
     http://*|http://*)
        toolchain/patch-kernel ..
        ;;

     *)
        if [ -d $$p ]; then
        ..
esac

But not a big deal.

-- 
Bye, Peter Korsgaard
