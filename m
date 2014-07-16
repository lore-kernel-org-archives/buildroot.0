From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Jul 2014 10:18:14 +0200
Subject: [Buildroot] [PATCH 0/3] Make exim more configurable
In-Reply-To: <20140715213125.1b848b48@free-electrons.com>
References: <1404489386-7523-1-git-send-email-luca@lucaceresoli.net>
 <20140715213125.1b848b48@free-electrons.com>
Message-ID: <53C63546.4040204@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Fri,  4 Jul 2014 17:56:23 +0200, Luca Ceresoli wrote:
>> Hi,
>>
>> this small patch series makes the exim mail transfer agent more configurable
>> at build time.
>>
>> Exim does not use a framework such as the autotools or CMake for its
>> build-time configuration. Instead it requires to provide a Makefile
>> (./Local/Makefile) with variables set appropriately. This Makefile is then
>> included by the main Makefile.
>>
>> These patches allow to use a custom configuration Makefile provided by the
>> user and to tweak (in the Buildroot config) the user that will run the exim
>> processes.
>>
>> Luca
>>
>> Luca Ceresoli (3):
>>    exim: allow using a custom configuration file
>
> Thanks, I've applied this patch.
>
>>    exim: make EXIM_USER configurable
>>    exim: generate the user with automatic uid
>
> However, I've for now rejected those two patches. The reason is that I
> don't think we should add an option to customize the user with which
> each and every daemon is started. Buildroot should use a sane default
> option, and for additional configuration, leave it to the Buildroot
> user to use BR2_ROOTFS_USERS_TABLES to create any additional/custom
> user that may be needed.

I generally agree with you.

The problem with exim is that it does not allow to configure its user
from a runtime configuration file, because it's hard-coded in the
binary. The only way to select a user is to change the build-time
configuration.

So, it's true that one can easily create a new user for exim using
BR2_ROOTFS_USERS_TABLES. But currently the only way to tell exim to use
that user is to supply an entire config file (which is possible thanks
to patch 1 that you've just applied). This would bring out of sync from
changes in the config file coming from upstream (exim as well as
Buildroot).

Patch 2 allows one to keep the Buildroot-provided configuration file,
and Buildroot would take care of tweaking the one line needed to
actually use the new username.

I hope this clarifies the use case.

Bye,
-- 
Luca
