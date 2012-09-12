From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Sep 2012 07:31:24 +0200
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <CADiAo4KFXtMDJqfjtVS1pu2EkHC=2EOFZ1LaN4dWw-ig9QsuGw@mail.gmail.com>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
 <504F8E7B.1060102@mind.be>
 <CADiAo4KFXtMDJqfjtVS1pu2EkHC=2EOFZ1LaN4dWw-ig9QsuGw@mail.gmail.com>
Message-ID: <50501E2C.6080306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/12 21:52, Dmitry Golubovsky wrote:
> Arnout,
>
> On Tue, Sep 11, 2012 at 3:18 PM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> On 09/08/12 06:21, Dmitry wrote:
>>>
>>> The pam_userdb module is used to verify a username/password pair
>>> against values stored in a Berkeley DB database. The database is
>>> indexed by the username, and the data fields corresponding to the
>>> username keys are the passwords (from man 8 pam_userdb).
>>
>>
>>   There is a patch on the list that introduces gdbm.  Do you think that could
>> be an alternative for berkeleydb?
>
> I'm not sure. We'll need a choice of configurations then, whether to
> use gdbm or berkeleyDB for linux-pam. What if both are selected in
> menuconfig?

  I meant: maybe that's a simpler dependency than a specially-configured
berkeleydb.


> BerkeleyDB is much more advanced than GDBM, IMHO. One might prefer
> GDBM over Berkeley DB because of license perhaps, but otherwise why?
>
> If we want to implement it further, here's the possible logic:
>
> PAM's configure.in shows that there may be variants in --enable-db
> options. which means the logic would be:
>
> 1. See if Berkeley or GDBM is selected. If none, disable pam_userdb in
> PAM --enable-db=no
> 2. If Berkeley is selected, enable dbm in it and specify proper option
> in --enable-db=ndbm (I guess)
> 3. If GDBM is selected, specify proper option in --enable-db=db (again
> I guess, maybe other way around)
> 4. If both are selected? there is an option --enable-db=yes which lets
> PAM decide by itself, then dbm should be enabled in BerkeleyDB anyway
> (it seems like configure only looks at headers*)
>
> Does anybody disagree with such logic?

  Looks good.  Although there should probably be a third config symbol
to simplify the logic - but we don't even have that yet for xml2/expat.


> Plus, the database selected for PAM should become a PAM dependency.
> Which we cannot tell unless we have a configure choice for the
> database in PAM, but this turns the above logic upside down: PAM now
> drives the database selection.
>
> Or we can make both databases, if selected, dependencies of PAM - at
> worst this only affects the building order.

  Yep, that's the way to do it.


> And what is the status of the GDBM patch?

  It's a bit hidden in the perl series, but I just acked it.

>
> Thanks.
>
> ------------------------
> * as in the failed autobuilder case, PAM's configure decided to build
> pam_userdb if BerkeleyDB was selected (headers were present) even
> though dbm was not enabled in it - linkage test was not done.

  Since these patches are still under review, maybe it's best to first
commit an individual patch that just does --disable-db ?  Can you do
that and check if it fixes the autobuilder issue?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
