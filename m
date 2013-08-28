From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 28 Aug 2013 09:42:45 +0200
Subject: [Buildroot] autobuild statistics graph
In-Reply-To: <20130828091036.1a91b786@skate>
References: <CAAXf6LW8axKFZpiQFjmqWcFXTEqaHoD3uX=hk5ZSQbmz_7BabA@mail.gmail.com>
 <20130828091036.1a91b786@skate>
Message-ID: <CAAXf6LWFMtmDpFvZODkd3N_Wsk-VwNP-QVkquRhn3B2aiOjCqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 28, 2013 at 9:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 28 Aug 2013 08:46:50 +0200, Thomas De Schampheleire wrote:
>
>> The autobuild statistics shows a graph with the number of
>> failed/successful/total builds at:
>> http://autobuild.buildroot.org/stats.php
>>
>> However, given that the total number of builds executed each day is
>> varying, it is difficult to visually draw conclusions from the graph.
>
> Yeah, now you realize that I was sleeping during all those statistics
> courses at the university :)
>
>> I would like to propose adding another graph (or replacing the current
>> one) that plots the percentages of successful/failed builds. Hence,
>> the reference will always be 100%, and a 'success' line going up means
>> improvement.
>> In fact, in this case it makes little sense to plot both the success
>> and failure lines, so we can choose either one.
>>
>> What do you think?
>
> Sounds sane. How would you compute what the reference is? Look at the
> build results of the last 30 days (i.e the ones that appear on the
> plot) ?

I was actually thinking of using the current calculated percentages.
So say on day 1 there are 100 builds, with 70 successful, and on day 2
there have been 50 builds with 25 successful, then I would plot 70%
for the first day and 50% for the second.
Given the variation in the configurations that are being built, a
rising success line from one day to the next cannot be interpreted as
an absolute reduction of bugs (could have been 'chance' because the
bad configurations weren't built on the second day) but if you look at
the trend it should tell us something.

There probably are more sophisticated ways to plot this data, but I'm
not sure it's needed for our purposes.

>
>> Is this difficult to realize?
>> If you give me some source code of how the graph is generated, I'm
>> willing to look into this.
>
> The code that generates the graph is available at
> http://git.buildroot.net/buildroot-test/tree/web/graph.php. Warning:
> ugly PHP code inside!

Here is some untested code that I think should do the trick (I don't
have a PHP environment at hand here):

diff --git a/web/graph.php b/web/graph.php
index c37bc88..7ac37d8 100644
--- a/web/graph.php
+++ b/web/graph.php
@@ -26,18 +26,16 @@ $total_data = array();

 while($current = mysql_fetch_object($ret)) {
   array_push($dates_data, $current->day);
-  array_push($success_data, $current->success);
-  array_push($failures_data, $current->failures);
-  array_push($timeouts_data, $current->timeouts);
-  array_push($total_data, $current->total);
+  array_push($success_data, $current->success * 100 / $current->total);
+  array_push($failures_data, $current->failures * 100 / $current->total);
+  array_push($timeouts_data, $current->timeouts * 100 / $current->total);
 }

 /* Add data in your dataset */
-$myData->addPoints($success_data, "success");
-$myData->addPoints($failures_data, "failure");
-$myData->addPoints($timeouts_data, "timeout");
-$myData->addPoints($total_data, "total");
-$myData->setAxisName(0,"Number of builds");
+$myData->addPoints($success_data, "success %");
+$myData->addPoints($failures_data, "failure %");
+$myData->addPoints($timeouts_data, "timeout %");
+$myData->setAxisName(0,"Percentage of builds");

 $myData->addPoints($dates_data, "Labels");
 $myData->setSerieDescription("Labels","Dates");
@@ -59,4 +57,4 @@
$myPicture->drawLegend(20,20,array("Style"=>LEGEND_NOBORDER,"Mode"=>LEGEND_HORIZ
 $myPicture->drawLineChart();

 $myPicture->Stroke();
-?>
\ No newline at end of file
+?>

---

Best regards,
Thomas
