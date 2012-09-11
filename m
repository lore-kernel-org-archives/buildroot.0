From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 11 Sep 2012 15:52:58 -0400
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <504F8E7B.1060102@mind.be>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
 <504F8E7B.1060102@mind.be>
Message-ID: <CADiAo4KFXtMDJqfjtVS1pu2EkHC=2EOFZ1LaN4dWw-ig9QsuGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Sep 11, 2012 at 3:18 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/08/12 06:21, Dmitry wrote:
>>
>> The pam_userdb module is used to verify a username/password pair
>> against values stored in a Berkeley DB database. The database is
>> indexed by the username, and the data fields corresponding to the
>> username keys are the passwords (from man 8 pam_userdb).
>
>
>  There is a patch on the list that introduces gdbm.  Do you think that could
> be an alternative for berkeleydb?

I'm not sure. We'll need a choice of configurations then, whether to
use gdbm or berkeleyDB for linux-pam. What if both are selected in
menuconfig?

BerkeleyDB is much more advanced than GDBM, IMHO. One might prefer
GDBM over Berkeley DB because of license perhaps, but otherwise why?

If we want to implement it further, here's the possible logic:

PAM's configure.in shows that there may be variants in --enable-db
options. which means the logic would be:

1. See if Berkeley or GDBM is selected. If none, disable pam_userdb in
PAM --enable-db=no
2. If Berkeley is selected, enable dbm in it and specify proper option
in --enable-db=ndbm (I guess)
3. If GDBM is selected, specify proper option in --enable-db=db (again
I guess, maybe other way around)
4. If both are selected? there is an option --enable-db=yes which lets
PAM decide by itself, then dbm should be enabled in BerkeleyDB anyway
(it seems like configure only looks at headers*)

Does anybody disagree with such logic?

Plus, the database selected for PAM should become a PAM dependency.
Which we cannot tell unless we have a configure choice for the
database in PAM, but this turns the above logic upside down: PAM now
drives the database selection.

Or we can make both databases, if selected, dependencies of PAM - at
worst this only affects the building order.

And what is the status of the GDBM patch?

Thanks.

------------------------
* as in the failed autobuilder case, PAM's configure decided to build
pam_userdb if BerkeleyDB was selected (headers were present) even
though dbm was not enabled in it - linkage test was not done.

-- 
Dmitry Golubovsky

Anywhere on the Web
