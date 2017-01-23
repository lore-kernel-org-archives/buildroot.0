From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Jan 2017 12:02:11 +0000
Subject: [Buildroot] SQLite upgrade
In-Reply-To: <1166793068.4748811485170873577.JavaMail.httpd@webmail-40.iol.local>
References: <1166793068.4748811485170873577.JavaMail.httpd@webmail-40.iol.local>
Message-ID: <df98e295-3d08-b2d2-f8b4-76be779a5824@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simone,

On 23/01/17 11:27, sred_94 at libero.it wrote:
> Dear Sirs,
> 
> Currently I use the branch "2016.05" of buildroot, which includes SQLite
> version 3120200, but I need to install SQLite version 3160200.
> 
> How can I solve this problem?
> 
> Thanking you in advance,

The 3120200 update happened with commit
0fc78cbe8b609c7c795e116d6107324458186013. You already have this commit
applied, that why you have that 3120200 version included.

The 3160200 update happened with commit
cc24879f85d7c6060957baf297993be687aa1794 and you would like to have that
version.

What you can do is:
 - list all commits that modify package/sqlite/ between 3120200 and 3160200
 - cherry-pick each one of those commits.

For instance, this will list all commits that modified package/sqlite/
between 3120200 and 3160200:

git log --reverse --pretty=format:"%h"
0fc78cbe8b609c7c795e116d6107324458186013..cc24879f85d7c6060957baf297993be687aa1794
package/sqlite/

Note, the first commit (which is the update to 3120200) is NOT included.
And the --reverse option is mandatory since you want the commits in
chronological order. The output should be something like this:

bd540fb
067b268
27281b5
75fc043
701f0e1
8af8c9d
ec1d29c
f08eeb8
cc24879

Now, for each one of those you need to perform a "git cherry-pick", so.
Below you have a one-liner command that does everything:

for commit in $(git log --reverse --pretty=format:"%h"
0fc78cbe8b609c7c795e116d6107324458186013..cc24879f85d7c6060957baf297993be687aa1794
package/sqlite/); do git cherry-pick $commit; done

That assumes you are checked-out on 2016.05 (git checkout 2016.05).

Regards,

Vincent

> 
> Simone Rossi
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
