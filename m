From: Esben Nielsen <nielsen.esben@gmail.com>
Date: Wed, 3 Apr 2019 17:46:45 +0200
Subject: [Buildroot] Failed to build in a user namespace without the
 root user
In-Reply-To: <87ftr0gsgo.fsf@dell.be.48ers.dk>
References: <CA+gSDyRCnG0HuJ4QVsFoROqCHBkn+MR7H39BQBmzHfHRm2B5gA@mail.gmail.com>
 <87ftr0gsgo.fsf@dell.be.48ers.dk>
Message-ID: <CA+gSDyT9ReuV4VxZc_3U3zspS8SeBbNzNFXqbLVrSComcgn8-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without FAKEROOTDONTTRYCHOWN it ends up in the kernel, which does a
lookup in the current user namespace and looks for uid 0 - which is
not there. Then it returns EINVAL, not EPERM.
When I set FAKEROOTDONTTRYCHOWN (from outside buildroot), I don't get that.

Hints how to reproduce:

bwrap --bind / / --uid 1000 --gid 1000 --dev /dev <make command>

bwrap 0.3.0 is compiled as user without suid bit set.

/Esben


On Tue, Apr 2, 2019 at 8:41 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Esben" == Esben Nielsen <nielsen.esben@gmail.com> writes:
>
>  > I try to build in an unpriviliged container (using bubblewrap), where
>  > I only have a single user id, not uid 0.
>
> Sounds special, but OK.
>
>  > I found the issue was in fakeroot, which per default when it does
>  > chown, it also asks the kernel if the id it does chown to actually
>  > exists. This is the default behaviour.
>
> Sorry, where do you see that? Looking at the fakeroot code, the only
> thing FAKEROOTDONTTRYCHOWN controls is if the wrapped chown also calls
> the real chown syscall:
>
> int chown(const char *path, uid_t owner, gid_t group){
> ..
>   if(!dont_try_chown())
>     r=next_lchown(path,owner,group);
>   else
>     r=0;
>   if(r&&(errno==EPERM))
>     r=0;
>
>   return r;
>
> Does lchown(path, 0, 0); return anything else than EPERM in your
> bubblewrap setup?
>
>
>  > Shouldn't it totally ignore the uid and gid map in the user namespace
>  > in the kernel?
>
> The goal is indeed that Buildroot builds do not differ based on the
> build host. We are not there yet though.
>
>
>  > Shoudln't that be default in buildroot? It is totally irrelevant,
>  > which is uids are mapped on the host when building a rootfs to run
>  > somewhere else.
>
> I have no problem with setting this environment variable the one place
> in fs/common.mk where we invoke fakeroot as there is indeed no reason to
> try to perform a chown "for real" for the Buildroot use cases, but I
> would like to understand what goes wrong exactly for you?
>
> --
> Bye, Peter Korsgaard
