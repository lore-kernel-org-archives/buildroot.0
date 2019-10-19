From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 21:48:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python: fix python 3.8.0
 package builds
In-Reply-To: <874l04ftbr.fsf@dell.be.48ers.dk>
References: <20191017162127.4261-1-james.hilliard1@gmail.com>
 <87o8yekrvs.fsf@dell.be.48ers.dk>
 <CADvTj4qmnPUxTQR1WihT03vZ7RxFvKe-wRPACD7eOCGnjP2g3A@mail.gmail.com>
 <ff412ced-b07d-b91a-fd3d-0bf32fcfc250@mind.be>
 <874l04ftbr.fsf@dell.be.48ers.dk>
Message-ID: <78a76e55-aa31-83c7-a771-6dc22bbb54e9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 21:06, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 19/10/2019 18:50, James Hilliard wrote:
>  >> On Sat, Oct 19, 2019 at 2:45 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>> 
>  >>>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
>  >>> 
>  >>> > We need to update the sysconfigdata path for python 3.8.0 per upstream
>  >>> > commit 7efc526e5cfb929a79c192ac2dcf7eb78d3a4401 which indicates the "m"
>  >>> > flag has been removed from sys.abiflags.
>  >>> 
>  >>> > Fixes this build error when building target packages:
>  >>> > ValueError: Empty module name
>  >>> 
>  >>> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>  >>> > ---
>  >>> >  package/pkg-python.mk | 2 +-
>  >>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>  >>> 
>  >>> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
>  >>> > index e906920417..be1ce071df 100644
>  >>> > --- a/package/pkg-python.mk
>  >>> > +++ b/package/pkg-python.mk
>  >>> > @@ -21,7 +21,7 @@
>  >>> >  ################################################################################
>  >>> 
>  >>> >  define PKG_PYTHON_SYSCONFIGDATA_NAME
>  >>> > -$(basename $(notdir $(wildcard
>  >>> > $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata_m_linux_*.py)))
>  >>> > +$(basename $(notdir $(wildcard
>  >>> > $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
>  >>> 
>  >>> Ehh, this presumably then breaks it for python 2.7?
>  >> I assume not since the path has $(PYTHON3_VERSION_MAJOR) in it which I
>  >> don't think does anything for python2 builds.
> 
>  >  To be entirely complete: in Python 2.7, it's called _sysconfigdata.py (without
>  > arch specification). However, since the thing is in a $(wildcard), nothing
>  > matches (even if we would use PYTHON_VERSION_MAJOR), so
>  > _PYTHON_SYSCONFIGDATA_NAME is set to empty.
> 
> Ahh yes. So why is it not needed on 2.7? Because it is installed in a
> location mentioned in PYTHONPATH?

 I'm not sure, but I think the reason why we pass it in Python3 is that
otherwise it will use _sysconfigdata_m_linux_x86_64-linux-gnu.py instead of
_sysconfigdata_m_linux_aarch64-linux-gnu.

 In Python2.7, there's only one sysconfigdata, which I assume is the one for
cross-compilation. Or maybe it's just wrong and we never noticed :-)

 Regards,
 Arnout

> 
>  >  In [1] I set _PYTHON_SYSCONFIGDATA_NAME to _sysconfigdata.py for Python2.7 (but
>  > only in meson-package, I'm not sure why...), but Adam says that this breaks
>  > libglib2...
> 
>  >  Anyway, this patch is definitely correct.
> 
> Correct. Applied, thanks.
> 
