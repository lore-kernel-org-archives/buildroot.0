From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 19 Apr 2018 13:47:51 -0700
Subject: [Buildroot] [PATCH 1/1] package/x264: bump version
In-Reply-To: <20180411161845.7d6b3f49@windsurf>
References: <20180410191044.19425-1-bernd.kuhls@t-online.de>
 <20180411161845.7d6b3f49@windsurf>
Message-ID: <1231759d-6acc-92f1-32f7-88cc55c7a1b1@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/2018 07:18 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 10 Apr 2018 21:10:44 +0200, Bernd Kuhls wrote:
>> Added license hash.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/x264/x264.hash | 3 ++-
>>  package/x264/x264.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Applied to master, thanks.
> 

There seems to be some disagreement with the hash in this commit on master.

I can reproduce the same expected result that is also showing up on autobuild
in several places.  For example:

    http://autobuild.buildroot.org/results/442/442bc92891e75d4d8cbf3dc400fe248bb3a1a52c//build-end.log

I tracked this down to hash changing whether or not you have the following
commit, which is currently on master.

commit 54785851eeb775720aac8a0b6b423fda26ac8f27
Author: Yann E. MORIN <yann.morin.1998@free.fr>
Date:   Sat Apr 7 23:26:14 2018 +0200

    download/git: fix transform-name

    When a package contains a relative symlink which first component is '..'
    (thus pointing one directory higher), for example package 'meh' contains
    this symlink:

        foo/bar -> ../buz

    then it would be stored as 'meh-version./buz' because of the
    transform-name pattern replacement.

    Fix it to only match the leading './'.

So, maybe just a race condition bringing in the x264 hash file update?  Is there
something else going on here or is the simple fix to just change the hash?

Josh
