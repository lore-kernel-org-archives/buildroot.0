From: =?UTF-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau.dev@gmail.com>
Date: Sun, 21 Jun 2015 16:07:59 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: support building the binary
 without MMU
In-Reply-To: <5586AF6B.6020304@mind.be>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <20150621064540.534ebebc@free-electrons.com> <5586AF6B.6020304@mind.be>
Message-ID: <CA+sos799wxw7gBHq9GsFVRNTq8YhsQnJQE94Eth8711vDu9DKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle, Thomas Petazzoni,

On Sun, Jun 21, 2015 at 2:34 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 06/21/15 06:45, Thomas Petazzoni wrote:
>> Dear Beno?t Th?baudeau,
>>
>> On Fri, 19 Jun 2015 12:54:33 +0200, Beno?t Th?baudeau wrote:
>>> The commit 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable
>>> apps for NOMMU" prevented the openssl binary from being built without
>>> MMU in order to fix a build failure without fork(). However, openssl is
>>> designed to support the lack of fork() with -DHAVE_FORK=0, so allow the
>>> openssl binary to be enabled without MMU thanks to this option.
>>>
>>> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
>>
>> Hum. But then it means that we have propagated the MMU dependency to
>> all reverse dependencies of openssl (i.e packages that depend on
>> openssl), but they may no longer need this dependency anymore.
>
>  This is only about BR2_PACKAGE_OPENSSL_BIN, which is not selected by any package.

It's indeed only about the binary, not about the library.

>> There is a fairly huge list of packages that "select
>> BR2_PACKAGE_OPENSSL". How can we find out which ones will now build
>> fine without MMU support ?
>>
>> By the way, do you have a specific need for openssl on no-MMU
>> platforms? If so, on which platform? We don't have many no-MMU users,
>> so it's good when they speak up :-)

Actually, no. To make the full story short, I was comparing Buildroot
2011.08 to the current master, and I noticed that openssl.cnf and some
other files had disappeared in the built target files (see 2/2), and
the investigation led me to the commit
720893b62510438237b9923d744dd079ddb4f67d, which led to 1/2 here.

Best regards,
Beno?t
