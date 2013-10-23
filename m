From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Wed, 23 Oct 2013 20:58:41 +0200
Subject: [Buildroot] Tool to check packages updates
In-Reply-To: <526809E4.30203@mind.be>
References: <CACjG4BJq5TXvpMAoU7w3JgTVrOGHpeKng88HU03Rf_=XunPKAQ@mail.gmail.com>
 <CAAXf6LW1c32E_BFwbD6JKMCRKWtCw4r7pc9xuj3_DPsGyjL=SA@mail.gmail.com>
 <CACjG4B+7riHKmXG0Oo3cZxrWFygTBojSTHRktuYvz0eeMJ0ttQ@mail.gmail.com>
 <526809E4.30203@mind.be>
Message-ID: <CACjG4BJtk-JxzUGmJn9urrMGMjkcwtmMxRys_FGrY761H1zQzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, you're right, see the script bellow.
What need to be done is evaluate variable PACKAGE_SITE and PACKAGE_VERSION,
for the moment it doesn't evalute things like
PACKAGE_VERSION = $(VERSION_MAJOR).xx so I need to write a small recursive
function to retrieve the real value.
I also need to work on package source hosted with a CVS (mainly git and
svn).

Regards,

Arnaud

#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import urllib2
from ftplib import FTP
import re
from os import listdir
from os.path import exists, isfile
import shutil
from distutils.version import LooseVersion

# mysql_client takes too long (why?ftp pb?)
exception_list = ('fan-ctrl', 'mysql_client')

def get_url_and_version(package_mk, package_name):
    version = ''
    site_url = ''
    package_name_mk = package_name.upper().replace('-','_')
    for line in open(package_mk):
        if 'include' in line:
            print 'TODO include in package name'
            site_url = ''
            version = '0'
        if package_name_mk + '_SITE ' in line:
            if '$' in line:
                print 'to be evaluated'
            else:
                site_url = line.split('= ')[1][:-1]
        if package_name_mk + '_VERSION ' in line:
            version = get_current_version(line)

    return (site_url, version)


# return version, evaluate it when using variables
def get_current_version(version_string):

    # if we need to evaluate the string
    if '$' in version_string:
        version = 'to be evaluated' + version_string
    else:
        try:
            version = version_string.split('= ')[1][:-1]
        except IndexError:
            version = 'unknown'

    return version

## Helpers functions

def helper_get_longest_sequence(search_str):
    longest_match = ''
    for match in re.finditer(r'((\d+\.)*(\d)+)', search_str):
        if len(match.group(0)) > len(longest_match):
            longest_match = match.group(0)
    return longest_match

def helper_get_last_version(search_str):
    last_version  = LooseVersion('0')
    for version in search_str:
        if (LooseVersion(version)) > last_version:
            last_version = version

    return last_version


## functions to retrieve last version ##

# * Specific website
# * try to find last version by listing available downloads
def get_last_version(package_name, site_url):
    print >> sys.stderr,'specific website : ' + site_url
    try:
        result = urllib2.urlopen(site_url).read()
    except:
        return 'website error'

    last_version = re.findall(r'%s-(.*)(.zip|.tar.gz|.tar.bz2)' %
package_name, result)
    last_version = [i[0] for i in last_version]
#    print last_version
    try:
        last_version = helper_get_last_version(last_version).split('-')[-1]
    except:
        print 'can\'t determine site version'
        return 'unknown'
    print last_version

    return last_version

# * FTP
# * try to find last version by listing FTP dir
def get_last_version_ftp(package_name, site_url):
    base_url = site_url.split('/')[2]
    directory = site_url.split(base_url)[1]

    print >> sys.stderr,'ftp : ' + base_url + ' ' + directory

    try:
        ftp = FTP(base_url)
        ftp.login()
        ftp.cwd(directory)
        files = []
        ftp.retrlines('LIST', files.append)
        ftp.quit()
    except:
        return 'ftp error'
    versions = [i.split(' ')[-1] for i in files]
#    print versions

    try:
        last_version = helper_get_last_version(versions).split('-')[-1]
    except:
        print 'can\'t determine last ftp version'
        return 'unknown'
    print last_version

    return last_version

# * Sourceforge.net
# * The following url give you the url of the last version available
# * http://sourceforge.net/projects/PROJECT_NAME/files/latest/download
def get_last_version_sf(site_url):
    print >> sys.stderr,'sourceforge website'
    if '/project/' in site_url:
        package_sf_name = site_url.split('project/')[1].split('/')[0]
    elif '/sourceforge/' in site_url:
        package_sf_name = site_url.split('/sourceforge/')[1].split('/')[0]
    elif '.cvs.' in site_url:
        package_sf_name = site_url.split('http://')[1].split('.')[0]
    elif '.sourceforge.net' in site_url:
        package_sf_name = site_url.split('.sourceforge.net
')[0].split('//')[1]
    else:
        print >> sys.stderr, 'Can\'t find sf package name'
#    print >> sys.stderr,package_sf_name
    project_url = 'http://sourceforge.net/projects/%s/files/latest/download'
% package_sf_name
#    print >> sys.stderr,project_url
    try:
        result = urllib2.urlopen(project_url).geturl()
    except urllib2.HTTPError:
        return 'website error'
    result = urllib2.unquote(result) # replace all hexa caracters like %20
#    print >> sys.stderr,result
    last_version = helper_get_longest_sequence(result)
    if (last_version == None):
        return 'unknown'
    print >> sys.stderr,last_version

    return last_version

# * googlecode.com
# * The following url give you the url of the last version available
# * https://code.google.com/p/PROJECT_NAME/downloads/list
def get_last_version_gc(site_url):
    print >> sys.stderr,'googlecode website'
    if '.googlecode.com' in site_url:
        package_gc_name = site_url.split('.googlecode.com
')[0].split('//')[1]
    else:
        print >> sys.stderr, 'Can\'t find gc package name'
#    print >> sys.stderr,package_gc_name

    try:
        result = urllib2.urlopen('
https://code.google.com/p/%s/downloads/list'% package_gc_name).read()
    except urllib2.HTTPError:
        print 'website error'
        return 'website error'

    #result = urllib2.unquote(result) # replace all hexa caracters like %20
    last_version = re.findall(r'name=%s-(.*)(.zip|.tar.gz|.tar.bz2)' %
package_gc_name, result)
    last_version = [i[0] for i in last_version]

    try:
        last_version = helper_get_last_version(last_version).split('-')[-1]
    except:
        print 'can\'t determine googlecode version'
        return 'unknown'
    print last_version

    return last_version


def check(package_name):
    print >> sys.stderr, 'Checking package: ' + package_name
    if package_name in exception_list:
        print >> sys.stderr, 'Exception package!TODO later'
        return('unknown', 'unknown', 'unknown')
    package_mk = '../../package/' + package_name + '/' + package_name +
'.mk'
    # Check if package exists
    if exists(package_mk) == False:
        print >> sys.stderr,'Error: package doesn\'t exist'
        return('unknown', 'unknown', 'unknown')

    # Get package url and version
    print >> sys.stderr,'package exists'
    site_url = ""
    provider = ""
    version = ""
    last_version = 'unknown'

    (site_url, version) = get_url_and_version(package_mk, package_name)

    if site_url == '':
        print >> sys.stderr,'Error: package url not found'
        return(version, last_version, 'unknown')

    print >> sys.stderr,'site :' + site_url
    print >> sys.stderr,'version: ' + version

    # Check if there is a new version
    if ('sf.net' in site_url or 'sourceforge.net' in site_url):
        provider = 'sourceforge.net'
        last_version = get_last_version_sf(site_url)
    elif 'googlecode.com' in site_url:
        provider = 'googlecode.com'
        last_version = get_last_version_gc(site_url)
    elif 'ftp://' in site_url:
        provider = 'specific ftp'
        last_version = get_last_version_ftp(package_name, site_url)
    elif 'git://' in site_url:
        provider = 'git'
        last_version = 'unknown'
    else:
        provider = 'specific website'
        last_version = get_last_version(package_name, site_url)

    return (version,last_version,provider)

if __name__ == '__main__':
    nb_package = 0
    nb_package_uptodate = 0
    nb_package_toupdate = 0
    nb_package_unknown = 0
    shutil.copyfile('template.html', 'out.html')
    f = open('out.html', 'a')

    for package in listdir('../../package'):
        if isfile('../../package/' + package):
            continue
        nb_package += 1
        (current_version, last_version, provider) = check(package)
        if last_version == 'unknown' or last_version == 'website error':
            style = 'centered'
            nb_package_unknown += 1
        elif current_version == last_version:
            style = 'centered uptodate'
            nb_package_uptodate += 1
        else:
            style = 'centered old'
            nb_package_toupdate += 1
        f.write('<tr class="%s"><td>%s</td><td >%s</td>' % (style, package,
current_version))
        f.write('<td>%s</td><td>%s</td></tr>' % (last_version, provider))

    f.write('Stats: %d packages (%d up to date, %d old and %d unknown)' %
(nb_package, nb_package_uptodate, nb_package_toupdate, nb_package_unknown))
    print 'done!'




2013/10/23 Arnout Vandecappelle <arnout@mind.be>

> On 23/10/13 17:43, arnaud aujon wrote:
>
>>
>>     Please post your script when you
>>     think it's ok, but don't wait to much: the earlier the better, so that
>>     you can get early feedback, and maybe help/testing from others.
>>
>>
>> I will do it as soon as possible, but I want to make it easy to read
>> first. As I'm far to be a python expert, it will take me some time to get
>> used to the right way to code in python.
>>
>
>  Even so you can get feedback from the list already. In particular, it is
> useful to post something while it is still small - the larger the script,
> the less likely you get useful feedback.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/**arnoutvandecappelle<http://www.linkedin.com/in/arnoutvandecappelle>
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131023/d721cc48/attachment-0001.html>
