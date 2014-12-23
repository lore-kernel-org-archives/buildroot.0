From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 23 Dec 2014 13:33:37 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: Add an option to compile
 'nsenter' binary.
In-Reply-To: <20141223122043.5d559f5a@free-electrons.com>
References: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20141223122043.5d559f5a@free-electrons.com>
Message-ID: <54996121.3010301@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/12/2014 12:20, Thomas Petazzoni wrote:
> Dear Nicolas Cavallari,
> 
> We had this option in the past, but it was causing some problems with a
> number of toolchains, so we had to revert it. See:
> 
>   http://git.buildroot.net/buildroot/commit/package/util-linux?id=d293e64bfb75c4cbaab7e46472de674ee813d4aa

I didn't know. It was compiling fine with uclibc. Now I realize that
uclibc does not provide setns()...

> Has this issue been resolved?

Yes, there is a fallback in util-linux sources:

# if !defined(HAVE_SETNS) && defined(SYS_setns)
static inline int setns(int fd, int nstype)
{
        return syscall(SYS_setns, fd, nstype);
}
# endif
