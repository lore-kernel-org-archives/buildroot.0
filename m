From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2020 09:32:03 +0200
Subject: [Buildroot] [PATCH] package/python-txtorcon.mk: drop _py3 file
 for python 2.x to fix pycompile issue
In-Reply-To: <871rij7nw4.fsf@tarshish> (Baruch Siach's message of "Wed, 30 Sep
 2020 09:57:15 +0300")
References: <20200930065120.17466-1-peter@korsgaard.com>
 <871rij7nw4.fsf@tarshish>
Message-ID: <875z7vvhxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Wed, Sep 30 2020, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/76b580000e6311e88584874f942517badd6fadf6/
 >> 
 >> python-txtorcon DOES support python 2.x, but it contains some optional
 >> python 3 / async code in controller_py3.py which is conditionally used from
 >> controller.py:
 >> 
 >> try:
 >> from .controller_py3 import _AsyncOnionAuthContext
 >> HAVE_ASYNC = True
 >> except Exception:
 >> HAVE_ASYNC = False
 >> 
 >> pycompile unfortunately errors out on the async code:
 >> 
 >> ../scripts/pycompile.py ..
 >> error:   File "/usr/lib/python2.7/site-packages/txtorcon/controller_py3.py", line 13
 >> async def __aenter__(self):
 >> ^
 >> SyntaxError: invalid syntax
 >> 
 >> As a workaround, simply drop the unusable _py3 file from TARGET_DIR if
 >> building for python 2.x.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/python-txtorcon/python-txtorcon.mk | 9 +++++++++
 >> 1 file changed, 9 insertions(+)
 >> 
 >> diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
 >> index a01c0b2511..e25ce8ba38 100644
 >> --- a/package/python-txtorcon/python-txtorcon.mk
 >> +++ b/package/python-txtorcon/python-txtorcon.mk
 >> @@ -11,4 +11,13 @@ PYTHON_TXTORCON_SETUP_TYPE = setuptools
 >> PYTHON_TXTORCON_LICENSE = MIT
 >> PYTHON_TXTORCON_LICENSE_FILES = LICENSE
 >> 
 >> +ifeq ($(BR2_PACKAGE_PYTHON),y)
 >> +# only needed/valid for python 3.x
 >> +define PYTHON_TXTORCON_RM_PY3_FILE
 >> +	rm -f $(TARGET_DIR)//usr/lib/python*/site-packages/txtorcon/controller_py3.py

 > Redundant '/' before 'usr/'.

Ups, indeed - Will fix.

-- 
Bye, Peter Korsgaard
