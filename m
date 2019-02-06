From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 11:08:32 +0100
Subject: [Buildroot] openssl 1.1.x deprecated option
In-Reply-To: <CANQCQpYYxbhNZvvmzi7vjd+ZuWtxKqMZVxAwZwsjd-OzkQsgDw@mail.gmail.com>
References: <CANQCQpYYxbhNZvvmzi7vjd+ZuWtxKqMZVxAwZwsjd-OzkQsgDw@mail.gmail.com>
Message-ID: <20190206110832.5c5dc4b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Feb 2019 04:03:09 -0600
Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

> I was thinking about  how to manage the risk of a version bump vs
> backport patches and found another possible solution.
> 
> For openssl 1.1.x there are a series of deprecated APIs for items like
> EVP_MD_CTX* which are now disabled and seem to result in 1/2 of the
> failures. Would we entertain on some packages adding the libopenssl
> "enable-deprecated"  configure option [1] so that it re-enables those
> options (could do this like we currently do with a kconfig package = y
> condition in the libopenssl.mk)?   Both mongodb and sqlcipher which
> are currently failing should be resolved with this approach.
> 
> Is this worth testing out / proposing?

We could certainly have a BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED
option that enables those deprecated APIs, and have the packages that
need that do:

	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED if BR2_PACKAGE_LIBOPENSSL

Thanks to this option, a "git grep
BR2_PACKAGE_LIBOPENSSL_ENABLE_DEPRECATED" allows to quickly identify
which are the remaining packages that still need those deprecated APIs.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
