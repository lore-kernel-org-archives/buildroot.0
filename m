From: =?utf-8?q?Ra=C3=BAl_S=C3=A1nchez_Siles?= <rasasi78@gmail.com>
Date: Wed, 12 Jun 2013 08:24:58 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: Add upstream patch to avoid
	occasional mdev SIGSEGV.
In-Reply-To: <871u884b4l.fsf@dell.be.48ers.dk>
References: <20130611162412.GE18264@trismegisto.universo>
 <871u884b4l.fsf@dell.be.48ers.dk>
Message-ID: <201306120825.03217.rasasi78@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi:

El Martes, 11 de junio de 2013, Peter Korsgaard escribi?:
> >>>>> "Ra?l" == Ra?l S?nchez Siles <rasasi78@gmail.com> writes:
>  Ra?l> This implies rename of previous patch for a correct patch ordering.
>  Ra?l> Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
>  Ra?l> ---
>  Ra?l>  ...21.0-mdev.patch => busybox-1.21.0-mdev_1.patch} |    0
>  Ra?l>  .../busybox-1.21.0-mdev_2_check_ACTION.patch       |   32
> ++++++++++++++++++++
> 
> I would prefer to not rename the existing patch, as it makes it less
> clear where it comes from (http://busybox.net/downloads/fixes-1.21.0/).
> 
> It shouldn't be necessary either as '.' comes before '_' (but not before
> '-').

  That's not what I got here. I've done a more comprehensive test:
$ ls -1 |sort 
busybox-1.21.0-mdev_2_check_ACTION.patch
busybox-1.21.0-mdev_check_ACTION.patch
busybox-1.21.0-mdev-check_ACTION.patch
busybox-1.21.0-mdev.patch

  As you can see the one we want to apply first comes last compared with other 
possibilities :/

> 
> Talking of which, why is this patch not in the fixes directory? Does
> Denys not consider it important enough?

  That's probably something to ask him. I found this bug by chance and I don't 
consider it critical in any way, altough I haven't explored further 
implications. This can be reproduced when you invoke mdev without parameters. It 
will SIGSEGV since, as per current 1.21.0 code, you'll check for ACTION 
environment variable, which doesn't exist. This means a null pointer which is 
passed to index_in_strings which, in turn, passes it to the uclibc strcmp 
function that is unable to handle this case gracefully.

  Regards,

-- 
     Ra?l S?nchez Siles
----->Proud Debian user<-----
Linux registered user #416098
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130612/c15bfe39/attachment-0001.asc>
