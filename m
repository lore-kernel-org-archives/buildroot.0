From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 11 Apr 2015 09:00:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/makedevs: add recursive option
In-Reply-To: <871tjrek5s.fsf@dell.be.48ers.dk>
References: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
 <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
 <871tjrek5s.fsf@dell.be.48ers.dk>
Message-ID: <CA+TH9V=__byXvPOE+qd6Jkj2cv+g9gfvPX-Wsgmq=4QQ2_7W=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

2015-04-10 23:41 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
>
>  > This patch adds the possibilty to change owner/permission
>  > of a folder recursively.
>
> Thanks, a few comments:
>
>  > +bb_recursive(const char *full_name, uid_t uid, gid_t gid, unsigned int mode){
>  > +
>  > +    int chmod_chown(const char *fpath, const struct stat *sb,
>  > +            int tflag, struct FTW *ftwbuf) {
>  > +            if (chown(fpath, uid, gid) == -1) return -1;
>  > +            if ((mode != -1)) {
>  > +                    if (chmod(fpath, mode) < 0) return -1;
>  > +            }
>  > +            return 0;
>  > +    }
>
> I know you are doing this because nftw doesn't allow any extra arguments
> to be passed to the function, but using GCC specific nested functions
> isn't really nice.
> Does E.G. clang support these?

Doh! I thought nested function could be a more widespread feature! Of
course, you are right, clang doesn't support nested functions.

The naive solution could be to add a global object, could be acceptable?
There are only three variables and could be nested inside a nice structure.

> Alternatively we could port
> recursive_action() from busybox.

/ * Unfortunately, while nftw(3) could replace this and reduce
 * code size a bit, nftw() wasn't supported before GNU libc 2.1,
 * and so isn't sufficiently portable to take over since glibc2.1
 * is so stinking huge.
 */

The only reason why they stick with an hand made recursive function
instead of nftw is to support older glibc 2.1 (!) that doesn't have
that function.
I think it's not our problem and backporting that old code is not a good idea!

What do you think?

> It would also be good to stick some bb_error_msg in there so people can
> get a hint about what fails.

Ok!

>
> --
> Bye, Peter Korsgaard



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
