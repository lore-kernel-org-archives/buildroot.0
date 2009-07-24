From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 23:02:54 +0200
Subject: [Buildroot] Script to send pull request and patches together
In-Reply-To: <4A69DEEB.3010206@atmel.com>
References: <4A69DEEB.3010206@atmel.com>
Message-ID: <20090724230254.22236fd8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Jul 2009 18:18:51 +0200,
Ulf Samuelsson <ulf.samuelsson@atmel.com> a ?crit :

> I am sending two patches to the ML.
> 1: will remove "target/linux/Config.in.experimental" which is not
> used. 2: will update minor/major versions
> 
> They can be pulled from git://git.buildroot.net/~ulf/git/linux.git

As I was tired of sending pull requests and sending the patches
separatly, I did a small ugly script. It might be useful for others, so
here it is:

#!/bin/sh

# Automate the process of generating a pull request, formatting the
# patches, and sending all of them by mail. This is useful because
# there are some projects in which sending a pull request is not
# enough, and sending the patches together with the pull request
# allows for a wider peer-review of the code.

base=$1
url=$2
email=$3

if [ ! -d .git ] ; then
    echo "Not in a git repo"
    exit 1
fi

summary=$(mktemp)

git request-pull $base $url > $summary

if [ $? -ne 0 ] ; then
    echo "git request-pull failed, aborting"
    rm -f $summary
    exit 1
fi

patches=$(mktemp -d)

git format-patch -o $patches -n --cover-letter --thread $base > /dev/null

if [ $? -ne 0 ] ; then
    echo "git format-patch failed, aborting"
    rm -f $summary
    rm -rf $patches
    exit 1
fi

mv $patches/0000-cover-letter.patch $patches/cover.tmp
awk '/^Subject/ { exit } // { print }' $patches/cover.tmp > $patches/0000-cover-letter.patch
rm -f $patches/cover.tmp

headrev=`git rev-parse --verify HEAD^0`
branch=$(git ls-remote $url | grep ^$headrev | cut -f2 | sed 's%refs/heads/%%')

echo "Subject: [pull request] Pull request for branch $branch" >> $patches/0000-cover-letter.patch
echo "" >> $patches/0000-cover-letter.patch
cat $summary >> $patches/0000-cover-letter.patch
echo "" >> $patches/0000-cover-letter.patch
echo "Thanks," >> $patches/0000-cover-letter.patch
echo "-- " >> $patches/0000-cover-letter.patch
git config --get user.name >> $patches/0000-cover-letter.patch

git send-email --quiet --no-chain-reply-to --to $email $patches/*

rm -f $summary
rm -rf $patches

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
