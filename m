From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 28 Aug 2014 21:51:42 +0200
Subject: [Buildroot] Custom kernal patch not being run
In-Reply-To: <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
References: <1409248855849-78152.post@n4.nabble.com>
 <8b3f2afb-67cb-4547-8956-fc4ed95402e5@email.android.com>
 <B9E2549378AA7A4EB6855F980A8E5B88F2EC59@MSCENT02.corp.mercury-security.com>
Message-ID: <CAAXf6LVmYO+uteXmaZ5X6r1TvpM=5Z-Gez3-gERnCr_2UqzCzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

(please don't top-post, and send mails in plaintext only)

On Thu, Aug 28, 2014 at 8:44 PM, buildrootcharles
<charles.s@mercury-security.com> wrote:
> Thanks Thomas, I just tried that command and it still does not implement my
> patch. When I execute the command ?make linux-dirclean linux? I see text
> that says ?>>> linux custom Download additional patches? is this supposed to
> indicate it found my patch? I?m guessing that I have the patch file named
> wrong as I have read it needs to match exactly what is trying to be patched
> but I don?t know if it should be named linux-custom (that?s the folder name
> in output->build->) should it be named the same as the custom kernel tarball
> (linux-3.10.4-July302014)?
>

The option BR2_LINUX_KERNEL_PATCH can contain just the directory name,
and this directory does not have any naming requirement.

The patches themselves should be named linux-something.patch. In your
original mail you wrote Linux-something.patch, with a capital L which
is not correct.

What you're supposed to see is something like:
>>> linux 3.16.1 Patching
for p in /tmp/foo/ ; do if echo $p | grep -q -E "^ftp://|^http://" ;
then support/scripts/apply-patches.sh
/home/tdescham/repo/contrib/buildroot-review/output/build/linux-3.16.1
/home/tdescham/repo/contrib/dl `basename $p` ; elif test -d $p ; then
support/scripts/apply-patches.sh
/home/tdescham/repo/contrib/buildroot-review/output/build/linux-3.16.1
$p linux-\*.patch ; else support/scripts/apply-patches.sh
/home/tdescham/repo/contrib/buildroot-review/output/build/linux-3.16.1
`dirname $p` `basename $p` ; fi done

Applying linux-bar.patch using patch:


In this example, I had:
BR2_LINUX_KERNEL_PATCH="/tmp/foo/"

and
$ find /tmp/foo
/tmp/foo
/tmp/foo/Linux-baz.patch
/tmp/foo/linux-bar.patch

Best regards,
Thomas
