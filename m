From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Fri, 10 Oct 2014 12:45:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: add --delete to
	rsync
In-Reply-To: <20141010123659.187fd60d@free-electrons.com>
References: <1412932487-25373-1-git-send-email-alvaro.gamez@hazent.com>
 <20141010123659.187fd60d@free-electrons.com>
Message-ID: <CAM+bi4tggsVGy7w9eRKRF_zy_o2dFU7CEJu6nx2Nv1=vVrVtig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas

Yes, it would.

I think I see where your question comes from.

You would like for the object files to remain there in case nothing or
little has changed and its compilation can be omitted by the build
tool (make or whatever).

But it is my understanding that the main idea is to make $(@D) a copy
of the source to do the build there.
I've faced a problem in the case of a build that basically does gcc *.c -o out.
In this situation, if I remove one .c file on the source directory,
this doesn't get removed from $(@D) and the next time I invoke
package-rebuild this removed file is still compiled, even though it
doesn't exist now on the source.

Regards



2014-10-10 12:36 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Alvaro G. M,
>
> On Fri, 10 Oct 2014 11:14:47 +0200, Alvaro G. M wrote:
>> When a source overriden package is built and then its source code is modified
>> and rebuilt with make package-rebuild, it is needed for the build directory
>> to contain exactly the same source that is in the original directory,
>> so rsync must not only copy missing files, but also remove those that existed
>> previously but now don't.
>>
>> Signed-off-by: Alvaro G. M <alvaro.gamez@hazent.com>
>> ---
>>  package/pkg-generic.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index f09f83e..440a750 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -117,7 +117,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
>>       @$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
>>       @test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
>>       $(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
>> -     rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
>> +     rsync --delete -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
>>       $(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
>>       $(Q)touch $@
>
> I don't remember how rsync behave exactly, but wouldn't this also
> remove object files, shared libraries and executables that will have
> been built in $(@D) ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
?lvaro G?mez Machado
