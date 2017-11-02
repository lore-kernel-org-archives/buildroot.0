From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 2 Nov 2017 16:06:12 -0700
Subject: [Buildroot] [PATCH v4] qt5: remove Qt Quick dependency on opengl
In-Reply-To: <20171102230302.26744909@windsurf>
References: <1509658876-29888-1-git-send-email-joshua.henderson@microchip.com>
 <20171102230302.26744909@windsurf>
Message-ID: <bd5262d5-19d7-fdcd-dd0d-5fd6b00bffaa@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 11/02/2017 03:03 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 2 Nov 2017 14:41:16 -0700, Joshua Henderson wrote:
> 
>> diff --git a/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
>> new file mode 100644
>> index 0000000..aca93be
>> --- /dev/null
>> +++ b/package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
>> @@ -0,0 +1,29 @@
>> +From fa52bb665d6beb77a951c14c8edcba3541850afc Mon Sep 17 00:00:00 2001
>> +From: Allan Sandfeld Jensen <allan.jensen@qt.io>
>> +Date: Mon, 25 Sep 2017 16:53:24 +0200
>> +Subject: [PATCH] Fix no-opengl builds
>> +
>> +The qquickwidgets examples uses OpenGL directly
>> +
>> +Change-Id: I1cc8cfbcf249abc98473287a9d499032232828c7
>> +Reviewed-by: Simon Hausmann <simon.hausmann@qt.io>
> 
> Who did the backport of this patch in Buildroot? It should carry the
> Signed-off-by from the person who did this backport. I don't know if
> it's you or S?bastien Szymanski.

I am the one guilty. Sigh.

> 
> Also, another question: I assume that if OpenGL is available, Qt Quick
> will use it. How does it detect that OpenGL is available?
> 

qt5declarative depends on qt5base.  If mesa3d is configured, qt5base depends
on mesa3d and is told to build with opengl.  Then, we leave buildroot. qt5base
build will try to find various incarnations of opengl through its own build
tests.  qt5base and qt5declarative use the result of those config tests
through qtConfig() to see if opengl is available.  If you build qt5base you
can see config.log and the actual tests under config.tests/ in the build_dir.

Now, you can still build QT with opengl support, and still opt to not use it
and instead use the software renderer at runtime with the environment variable
QMLSCENE_DEVICE=softwarecontext.  This patch is all about not making opengl a
requirement, where it is not.

Josh
