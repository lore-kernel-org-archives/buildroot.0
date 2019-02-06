From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Feb 2019 12:01:20 +0100
Subject: [Buildroot] openssl 1.1.x deprecated option
In-Reply-To: <20190206110832.5c5dc4b6@windsurf> (Thomas Petazzoni's message of
 "Wed, 6 Feb 2019 11:08:32 +0100")
References: <CANQCQpYYxbhNZvvmzi7vjd+ZuWtxKqMZVxAwZwsjd-OzkQsgDw@mail.gmail.com>
 <20190206110832.5c5dc4b6@windsurf>
Message-ID: <87ftt1ji4f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Wed, 6 Feb 2019 04:03:09 -0600
 > Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

 >> I was thinking about  how to manage the risk of a version bump vs
 >> backport patches and found another possible solution.
 >> 
 >> For openssl 1.1.x there are a series of deprecated APIs for items like
 >> EVP_MD_CTX* which are now disabled and seem to result in 1/2 of the
 >> failures. Would we entertain on some packages adding the libopenssl
 >> "enable-deprecated"  configure option [1] so that it re-enables those
 >> options (could do this like we currently do with a kconfig package = y
 >> condition in the libopenssl.mk)?   Both mongodb and sqlcipher which
 >> are currently failing should be resolved with this approach.
 >> 
 >> Is this worth testing out / proposing?

 > We could certainly have a BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED
 > option that enables those deprecated APIs, and have the packages that
 > need that do:

 > 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED if BR2_PACKAGE_LIBOPENSSL

 > Thanks to this option, a "git grep
 > BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED" allows to quickly identify
 > which are the remaining packages that still need those deprecated APIs.

Yes, that may be the most pragmatic option. Based on the statement in
https://github.com/openssl/openssl/issues/4985 it does sound like we
need to adjust the code (or CFLAGS) of each package using this option to
add:

#define OPENSSL_USE_DEPRECATED 1

Before including any openssl headers, which isn't nice - But still
better than complicated patches.

-- 
Bye, Peter Korsgaard
