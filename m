From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Apr 2015 23:41:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/makedevs: add recursive option
In-Reply-To: <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Fri, 13 Mar 2015 11:50:04 +0100")
References: <1426243805-8317-1-git-send-email-angelo.compagnucci@gmail.com>
 <1426243805-8317-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <871tjrek5s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > This patch adds the possibilty to change owner/permission
 > of a folder recursively.

Thanks, a few comments:

 > +bb_recursive(const char *full_name, uid_t uid, gid_t gid, unsigned int mode){
 > +
 > +	int chmod_chown(const char *fpath, const struct stat *sb,
 > +		int tflag, struct FTW *ftwbuf) {
 > +		if (chown(fpath, uid, gid) == -1) return -1;
 > +		if ((mode != -1)) {
 > +			if (chmod(fpath, mode) < 0) return -1;
 > +		}
 > +		return 0;
 > +	}

I know you are doing this because nftw doesn't allow any extra arguments
to be passed to the function, but using GCC specific nested functions
isn't really nice.

Does E.G. clang support these? Alternatively we could port
recursive_action() from busybox.

It would also be good to stick some bb_error_msg in there so people can
get a hint about what fails.

-- 
Bye, Peter Korsgaard
