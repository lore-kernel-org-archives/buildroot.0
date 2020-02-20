From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 20 Feb 2020 17:28:23 +0100
Subject: [Buildroot] [PATCH 2/4] package/volume_key: add new package
In-Reply-To: <20200218154739.7617bb04@windsurf>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-3-giulio.benetti@benettiengineering.com>
 <20200217195114.7336e67e@windsurf>
 <20bd5175-2e2c-a2b8-0ff0-350d58e01a9b@benettiengineering.com>
 <7785b80a-8198-23ed-5bed-9485c0a31075@benettiengineering.com>
 <20200218154739.7617bb04@windsurf>
Message-ID: <8a743536-d4dd-78e6-b38d-8532bca17b59@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/18/20 3:47 PM, Thomas Petazzoni wrote:
> On Tue, 18 Feb 2020 15:06:47 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>>> AC_PATH_PROG([GPG], [gpg2])
>>>> AC_ARG_VAR([GPG])
>>>> AC_DEFINE_UNQUOTED([GPG_PATH], "$GPG", [Path to the gpg2 executable])
>>>>
>>>> So don't we need gnupg on the host for this to work ?
>>>
>>> Yes, host-gnupg2, I've missed it since my distro provides it.
>>
>> I've retried building, gnupg2 only is supported but it's not mandatory
>> to build. So as I can understand we can avoid adding host-gnupg2.
> 
> Weird, I thought AC_PATH_PROG() was aborting if the tool was not found.
> If that's not the case, then we should ensure the build never uses
> gpg2, even if available, so that the build result doesn't depend on
> whether gpg2 is available system-wide or not.

I went deeper in the volume_key code and found that gnupg2 is needed at 
runtime to create packet with passphrase, so even if build doesn't fail 
gnupg2 is needed at runtime. In gcr packet is the same.

But then, it turns out that gnupg2's binary name is gpg and not gpg2, 
but usually gpg2 name is used(i.e. on Ubuntu 19.10). Also in gcr package 
they assume its name is gpg2 but if you try to build you find gpg. 
Gnupg2 failure is difficult to find since it's at runtime(i.e. gpgme 
calls /usr/bin/gpg2 to encrypt/decrypt something).

So what do you suggest? Better change gpg binary file name to gpg2 or 
better fix gcr package to use /usr/bin/gpg instead of /usr/bin/gpg2 And 
do the same here with volume-key?

Gcr package is wrong in any case at the moment, so it must be fixed, and 
find someone who's able to test it.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
